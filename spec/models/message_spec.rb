require 'rails_helper'

RSpec.describe Message, type: :model do
  before do
    @message = FactoryBot.build(:message)
  end

  describe 'メッセージの投稿' do
    context '投稿ができる場合' do
      it 'conとima' do
        expect(@message).to be_valid

      end
      it 'conだけ' do
        @message.image = nil
        expect(@message).to be_valid
      end
      it 'imaだけ' do
        @message.content = ""
        expect(@message).to be_valid
      end
    end

    context'投稿ができない場合' do
      it 'contentとimageが空では保存できない' do
        @message.content = ""
        @message.image =nil
        @message.valid?
        expect(@message.errors.full_messages).to include("")

      end
      it 'roomが紐付いていないと保存できない' do
        @message.room = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("")
      end
      it 'userが紐付いていないと保存できない' do
        @message.user=nil
        @message.valid?
        expect(@message.errors.full_messages).to include("")
      end
    end

  end
end
