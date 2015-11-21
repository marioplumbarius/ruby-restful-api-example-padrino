describe RestfulApi::App::ProjectsHelper do

  # setting up padrino's helper
  # see http://wikimatze.de/testing-helpers-in-padrino/
  subject(:helper) do
    class ProjectsHelperClass
      include RestfulApi::App::ProjectsHelper
    end

    ProjectsHelperClass.new
  end

end
