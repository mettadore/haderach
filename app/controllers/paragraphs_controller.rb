class ParagraphsController < ApplicationController

  def paragraph
    @paragraphs = []
    @universes = []
    this_universe = params[:universe] ? Universe.find(params[:universe]) : nil
    @num = params[:num].to_i > 0 ? params[:num].to_i : 1
    @min = params[:min].to_i > 0 ? params[:min].to_i : 20
    @num.times do
      para = Word.paragraph(@min, this_universe)
      @universes << Word.universes(para)
      @paragraphs << para
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @paragraphs }
      format.text {
          self.response_body = proc { |response, output|
              @paragraphs.each do |para|
                  para.each do |sentence|
                      output.write(sentence.collect(&:word).join(" ") + ".")
                      output.write("  ") unless sentence == para.last
                  end
                  output.write("\n\n") unless para == @paragraphs.last
              end
          }
      }
    end
  end
  
  def title
    @words = []
    @num = params[:num].to_i > 0 ? params[:num].to_i : 1
    @num.times do
      @words << Word.one
    end
    @universes = Word.universes([@words])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @paragraphs }
      format.text {
          self.response_body = proc { |response, output|
              output.write(@words.collect(&:word).join(" ").titleize)
          }
      }
    end
  end
    

end
