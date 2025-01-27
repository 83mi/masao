class Masao_Status
  VERSION = '0.0.4'
  def Masao_Status::Version
    VERSION
  end

  def Masao_Status::Update
    vfile = File::Stat.new(__FILE__)
    vfile.mtime
  end

  def Masao_Status::Init
    # Fri, 22 Sep 2023 23:45:33 +0900
    '2023-09-22 23:45:33 +0900'
  end
end

class Masao_Doc
  def Masao_Doc::ReleaseNote
    data = <<~EOF
      0.0.4 辞書更新 20250127
      0.0.3 backend: thin to Puma
      0.0.2 redis対応
      0.0.1 release
    EOF
  end

  def Masao_Doc::ReleaseNoteOld
    data = <<~EOF
      ""
    EOF
  end
end
