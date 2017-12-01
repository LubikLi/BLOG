class CodeGenerator
  def self.generate_code(number=6)
    number.times.map { Random.rand(10) }.join
  end
end