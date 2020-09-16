class Document
  def method1
    raise "yous should override this method in subclass"
  end
end

class TechnicalDocument < Document
  def method1
    puts "请阅读技术类文档"
  end
end

class AdministrativeDocument < Document
  def method1
    puts "请阅读行政类文档"
  end
end

class FinancialDocument < Document
  def method1
    puts "请阅读财务类文档"
  end
end

class DocumentFactory
  def initialize
    @map = {}
  end

  def add
    @map["技术"] = TechnicalDocument.new
    @map["行政"] = AdministrativeDocument.new
    @map["财务"] = FinancialDocument.new
  end

  def call(doc_type)
    @object = nil
    if @map.key? doc_type
      @object = @map[doc_type]
    else
      puts "没有此类文档"
      @object
    end
  end
end

factory = DocumentFactory.new
factory.add

doc1 = factory.call("技术")
if doc1 != nil then doc1.method1 end

doc1 = factory.call("养猪")
if doc1 != nil then doc1.method1 end
