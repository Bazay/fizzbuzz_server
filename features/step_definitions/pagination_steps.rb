Then(/^I expect (to|not to) see pagination (previous|next) button$/) do |verb, button|
  verb = verb.parameterize.underscore

  within first('.pagination') do
    expect(page).send verb, have_css(".l-page-#{button}")
  end
end

Then(/^I expect to be on pagination page ([0-9]+)$/) do |number|
  within first('.pagination') do
    expect(page).to have_css '.l-page-current-page', text: number
  end
end
