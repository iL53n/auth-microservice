Sequel.seed(:development) do
  def run
    [
      ['Nik', 'nik@test.com', 'givemeatoken'],
      ['Mike', 'mike@test.com', 'givemeatoken']
    ].each do |name, email, password|
      User.create name: name, email: email, password: password
    end
  end
end
