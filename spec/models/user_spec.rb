require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = Factorybot.build(:user)
    end
    context 'ユーザー作成ができる場合' do
      it '全ての項目が正しく存在すれば登録できる' do
      
      end
      it 'passwordが6文字以上で登録できる' do
      
      end
    end
    context 'ユーザー作成ができない場合' do
      it 'nicknameが空では登録できない' do
        
      end
      it 'emailが空では登録できない' do
        
      end
      it 'emailに＠が含まれていないと登録できない' do
        
      end
      it 'emailが他のユーザーと重複していると登録できない' do
        
      end
      it 'passwordが6文字より少ないと登録できない' do
        
      end
      it 'passwordとpassword_confirmationが一致しないと登録できない' do
      
      end  
      it 'last_nameが空だと登録できない' do
        
      end
      it 'last_nameが全角（漢字・ひらがな・カタカナ）でければ登録できない' do
        
      end
      it 'first_nameが空だと登録できない' do
        
      end
      it 'first_nameが全角（漢字・ひらがな・カタカナ）でければ登録できない' do
        
      end
      it 'last_name_kanaが空だと登録できない' do
        
      end
      it 'last_name_kanaが全角（カタカナ）でければ登録できない' do
        
      end
      it 'first_name_kanaが空だと登録できない' do
        
      end
      it 'first_name_kanaが全角（カタカナ）でければ登録できない' do
        
      end
      it 'birthdayの「年」が空だと登録できない' do
        
      end
      it 'birthdayの「月」が空だと登録できない' do
        
      end
      it 'birthdayの「日」が空だと登録できない' do
        
      end
    end
  end
end
