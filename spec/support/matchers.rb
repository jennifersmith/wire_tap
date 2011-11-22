RSpec::Matchers.define :be_a_file do
  match do |actual|
   File.exists? actual
  end
end
RSpec::Matchers.define :have_contents do |expected|
  match do |actual|
   File.read(actual) == expected
  end
end
