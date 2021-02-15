require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる時' do
      it 'nickname,email,password,password_confirmation,dateが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      describe 'passwordとpassword_confirmationが英数字6文字以上であれば登録できる' do
        it '小文字英字と数字の組み合わせで登録できる' do
          @user.password = '1aaaaa'
          @user.password_confirmation = @user.password
          expect(@user).to be_valid
        end
        it '大文字英字と数字の組み合わせで登録できる' do
          @user.password = '1AAAAA'
          @user.password_confirmation = @user.password
          expect(@user).to be_valid
        end
        it '大文字英字と小文字英字と数字の組み合わせで登録できる' do
          @user.password = '1AAAaa'
          @user.password_confirmation = @user.password
          expect(@user).to be_valid
        end
      end
    end

    context '新規登録できない時' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include 'ニックネームを入力してください'
      end
      it 'emailが空では登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include 'Eメールを入力してください'
      end
      it 'emailに＠がないと登録できない' do
        @user.email = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      it 'passwordが空では登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを入力してください')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
      end
      it 'dateが空では登録できない' do
        @user.date = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('生年月日を入力してください')
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'passwordが数字のみでは登録できない' do
        @user.password = '111111'
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードには半角英数字が必要です。')
      end
      it 'passwordが半角英字(小文字)のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードには半角英数字が必要です。')
      end
      it 'passwordが半角英字(大文字)のみでは登録できない' do
        @user.password = 'AAAAAA'
        @user.password = 'AAAAAA'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードには半角英数字が必要です。')
      end
      it 'passwordが半角英字(小文字と大文字)のみでは登録できない' do
        @user.password = 'aaaAAA'
        @user.password = 'aaaAAA'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードには半角英数字が必要です。')
      end
      it 'passwordが英数字5文字以下では登録できない' do
        @user.password = '11aaa'
        @user.password = '11aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
    end
  end
end
