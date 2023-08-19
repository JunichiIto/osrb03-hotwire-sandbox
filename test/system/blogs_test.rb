require "application_system_test_case"

class BlogsTest < ApplicationSystemTestCase
  def fill_in_blog_content(text)
    find("trix-editor").set(text)
  end

  def assert_blogs(expected_blogs)
    actual_blogs = all('#blogs > div')
    assert_equal expected_blogs.size, actual_blogs.size
    expected_blogs.each_with_index do |expected_blog, n|
      within actual_blogs[n] do
        title = find('h2').text
        content = find('.trix-content').text
        assert_equal expected_blog[:title], title
        assert_equal expected_blog[:content], content
      end
    end
  end

  def assert_flash(text)
    assert_css '.toast'
    toasts = all('.toast')
    assert_equal 1, toasts.size
    toast = toasts[0]
    within toast do
      assert_text text
    end
    find('.btn-close').click
    assert_no_css '.toast'
  end

  def wait_for_turbo
    sleep 0.5
  end

  test "CRUD" do
    visit blogs_url
    assert_selector "h1", text: "Blogs"
    assert_blogs([
                   { title: 'My first blog', content: 'Hi there!' },
                 ])

    # Create
    click_link 'New blog'
    assert_selector '.modal-title', text: 'New blog'
    wait_for_turbo
    # validation error
    fill_in 'Title', with: ' '
    click_button 'Create Blog'
    assert_text "can't be blank"

    fill_in 'Title', with: 'Hello'
    fill_in_blog_content 'World!'
    click_button 'Create Blog'
    assert_no_selector '.modal'
    assert_flash 'Blog was successfully created.'
    assert_blogs([
                   { title: 'Hello', content: 'World!' },
                   { title: 'My first blog', content: 'Hi there!' },
                 ])

    # Update
    click_link 'Hello'
    assert_selector '.modal-title', text: 'Editing blog'
    wait_for_turbo
    # validation error
    fill_in 'Title', with: ' '
    click_button 'Update Blog'
    assert_text "can't be blank"

    fill_in 'Title', with: 'My Turbo'
    fill_in_blog_content 'Turbo is fun!'
    click_button 'Update Blog'
    assert_no_selector '.modal'
    assert_flash 'Blog was successfully updated.'
    assert_blogs([
                   { title: 'My Turbo', content: 'Turbo is fun!' },
                   { title: 'My first blog', content: 'Hi there!' },
                 ])

    # Delete
    click_link 'My Turbo'
    assert_selector '.modal-title', text: 'Editing blog'
    wait_for_turbo
    accept_alert do
      find('.delete-button').click
    end
    assert_no_selector '.modal'
    assert_flash 'Blog was successfully destroyed.'
    assert_blogs([
                   { title: 'My first blog', content: 'Hi there!' },
                 ])
  end
end
