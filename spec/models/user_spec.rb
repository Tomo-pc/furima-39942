require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'すべての値が正しいときは登録できる' do
        expect(@user).to be_valid
      end
      it 'emailは@を含むと登録できる' do
        @user.email = 'aaa@ooo'
        expect(@user).to be_valid
      end
      it 'first_nameは全角であれば登録できる' do
        @user.first_name = '山田'
        expect(@user).to be_valid
      end
      it 'last_nameは全角であれば登録できる' do
        @user.last_name = '太郎'
        expect(@user).to be_valid
      end
      it 'first_kanaは全角であれば登録できる' do
        @user.first_kana = 'ヤマダ'
        expect(@user).to be_valid
      end
      it 'last_kanaは全角であれば登録できる' do
        @user.last_kana = 'タロウ'
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上だと登録できる' do
        @user.password = 'Tech39942'
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'first_kanaが空では登録できない' do
        @user.first_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First kana can't be blank")
      end
      it 'last_kanaが空では登録できない' do
        @user.last_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last kana can't be blank")
      end
      it 'birth_dayが空では登録できない' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
      it 'first_nameは全角でないと登録できない' do
        @user.first_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it 'last_nameは全角でないと登録できない' do
        @user.last_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end
      it 'first_kanaは全角でないと登録できない' do
        @user.first_kana = 'ｶﾅ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First kana is invalid')
      end
      it 'last_kanaは全角でないと登録できない' do
        @user.last_kana = 'ｶﾅ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last kana is invalid')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'aaa000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        a_user = FactoryBot.build(:user)
        a_user.email = @user.email
        a_user.valid?
        expect(a_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'aaaooo'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'aaa00'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it '英字のみのパスワードでは登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it '数字のみのパスワードでは登録できない' do
        @user.password = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it '全角文字を含むパスワードでは登録できない' do
        @user.password = 'b b b０００'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
    end
  end
end
