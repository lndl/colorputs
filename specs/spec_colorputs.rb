require './spec_helper'

describe 'Colorputs:' do
  before do
    class MyColorizedObject
      include Colorputs
    end
    @mco = MyColorizedObject.new
  end

  describe '::p ->' do
    describe 'when no Colorputs specifics args are sent,' do
      it 'must return like the original p method' do
        @mco.send(:p, 'Hello').should eql(p 'Hello')
      end
    end

    describe 'when some color is sent,' do
      describe 'when only one argument is sent to print,' do
        it 'must return like the original p method' do
          @mco.send(:p, 'Hello', :red).should eql(p 'Hello')
        end
        it 'must return only one valid string argument' do
          @mco.send(:p, 'Hello', :red).should be_a_kind_of String
        end
      end
      describe 'when an argument list is sent to print,' do
        it 'must return like the original p method' do
          @mco.send(:p, 'Hello','How','Are','You', :blue, :red).should eql(p 'Hello', 'How', 'Are', 'You', :blue)
        end
        it 'must return the whole argument list, except the color' do
          @mco.send(:p, 'Hello','How','Are','You', :blue, :red).should be_a_kind_of Array 
          @mco.send(:p, 'Hello','How','Are','You', :blue, :red).size.should eql(5) 
        end
      end
    end

    describe 'when a wrong color is sent,' do
      it 'safely ignore it and returns like an ordinary p method' do
        @mco.send(:p, 'Hello', :wrong).should eql(p 'Hello', :wrong)
      end

      it 'must return the whole argument list, including the wrong color label' do
        @mco.send(:p, 'Hello', :wrong).should be_a_kind_of Array 
        @mco.send(:p, 'Hello', :wrong).size.should eql(2)
      end
    end

    describe 'when blinking suffix is sent,' do
      it 'must return like the original p method' do
        @mco.send(:p, 'Hello', :red_b).should eql(p 'Hello', :red_b)
      end
      it 'must return only one valid string argument' do
        @mco.send(:p, 'Hello', :red_b).should be_a_kind_of String
      end
    end
  end

  describe '::puts ->' do
    describe 'when no Colorputs specifics args are sent,' do
      it 'must return like the original puts method' do
        @mco.send(:puts, 'Hello').should eql(puts 'Hello')
      end
    end

    describe 'when some color is sent,' do
      describe 'when only one argument is sent to print,' do
        it 'must return like the original puts method' do
          @mco.send(:puts, 'Hello', :red).should eql(puts 'Hello')
        end
      end
      describe 'when an argument list is sent to print,' do
        it 'must return like the original puts method' do
          @mco.send(:puts, 'Hello','How','Are','You', :blue, :red).should eql(puts 'Hello', 'How', 'Are', 'You', :blue)
        end
      end
    end

    describe 'when a wrong color is sent,' do
      it 'safely ignore it and returns like an ordinary puts method' do
        @mco.send(:puts, 'Hello', :wrong).should eql(puts 'Hello', :wrong)
      end
    end

    describe 'when blinking suffix is sent,' do
      it 'must return like the original puts method' do
        @mco.send(:puts, 'Hello', :red_b).should eql(puts 'Hello', :red_b)
      end
    end
  end

end
