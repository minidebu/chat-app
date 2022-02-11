require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規ユーザー登録' do
    context'新規登録できる場合' do
      it "name email pass pass_cofiが正確書かれている" do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき'do
      it 'nameが空の時' do
        @user.name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it 'メールがからの時' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")

      end
      it 'pass' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'メールが重複' do
        user = FactoryBot.create(:user)
        @user.email = user.email
        @user.valid?
        expect(@user.errors.full_messages).to include('Email has already been taken')

      end
      it 'emailに@がない' do  
      

      end

    end
  end
end
