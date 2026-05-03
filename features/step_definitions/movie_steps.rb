Given("I am on the RottenPotatoes home page") do
  visit("/")
end

Then("I should see {string}") do |text|
  expect(page).to have_content(text)
end

Then("I should be on the RottenPotatoes home page") do
  expect(page).to have_current_path(movies_path)
end

Then("I should see {string} before {string}") do |e1, e2|
  expect(page.body.index(e1)).to be < page.body.index(e2)
end

Then("I should be on the Create New Movie page") do
  expect(page).to have_current_path(new_movie_path)
end

When("I fill in {string} with {string}") do |field, value|
  fill_in(field, with: value)
end

When("I follow {string}") do |link|
  click_link(link)
end

And("I press {string}") do |button|
  click_button(button)
end

And("I select {string} from {string}") do |value, field|
  select(value, from: field)
end