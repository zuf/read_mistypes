RSpec.describe ReadMistypes do
  it "has a version number" do
    expect(ReadMistypes::VERSION).not_to be nil
  end

  it "should convert mistyped text" do
    expect(ReadMistypes::convert_mistypes('ghbdtn', :ru)).to eq('привет')
  end

  it "should convert mistyped text mixed with normal one" do
    expect(ReadMistypes::convert_mistypes('Ghbdtn^ мир!')).to eq('Привет, мир!')
  end

  it "should not convert normal text" do
    expect(ReadMistypes::convert_mistypes("Привет мир!")).to eq("Привет мир!")
  end
end
