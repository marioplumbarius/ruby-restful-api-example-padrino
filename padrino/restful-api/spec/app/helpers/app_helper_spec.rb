describe RestfulApi::App::AppHelper do

  # setting up padrino's helper
  # see http://wikimatze.de/testing-helpers-in-padrino/
  subject(:helper) do
    class AppHelperClass
      include RestfulApi::App::AppHelper
    end

    AppHelperClass.new
  end

  describe '#body_valid?' do
    pending "code me :)"
  end

  describe '#request_requires_body?' do
    pending "code me :)"
  end

end
