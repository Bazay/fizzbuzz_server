Then(/^I expect to see the fizz buzz table$/) do
  within '.container' do
    expect(page).to have_css '.b-fizz-buzz-table'
  end
end

Then(/^I expect (to|not to) see a fizz buzz for the number ([0-9]+)$/) do |verb, number|
  verb = verb.parameterize.underscore

  within '.b-fizz-buzz-table' do
    expect(page).send verb, have_css('.b-fizz-buzz-item-number', text: number)
  end
end

Then(/^I expect (to|not to) see a favourite fizz buzz$/) do |verb|
  verb = verb.parameterize.underscore

  within '.b-fizz-buzz-table' do
    expect(page).send verb, have_css('.b-fizz-buzz-item-favourite .glyphicon-star')
  end
end
