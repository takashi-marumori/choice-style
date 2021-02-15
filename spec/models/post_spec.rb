require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe 'スタイル登録' do
    context '登録できる時' do
      it 'images,clothes_id,season_id,gender_idがあれば登録できる' do
        expect(@post).to be_valid
      end
      it 'memoは空でも登録できる' do
        @post.memo = nil
        expect(@post).to be_valid
      end
    end

    context '登録できない時' do
      it 'imagesが空だと登録できない' do
        @post.images = nil
        @post.valid?
        expect(@post.errors.full_messages).to include '画像を選択してください'
      end
      it 'clothes_idが空だと登録できない' do
        @post.clothes_id = nil
        @post.valid?
        expect(@post.errors.full_messages).to include '種類を選択してください'
      end
      it 'clothes_idが1だと登録できない' do
        @post.clothes_id = '1'
        @post.valid?
        expect(@post.errors.full_messages).to include '種類を選択してください'
      end
      it 'season_idが空だと登録できない' do
        @post.season_id = nil
        @post.valid?
        expect(@post.errors.full_messages).to include '季節を選択してください'
      end
      it 'season_idが1だと登録できない' do
        @post.season_id = '1'
        @post.valid?
        expect(@post.errors.full_messages).to include '季節を選択してください'
      end
      it 'gender_idが空だと登録できない' do
        @post.gender_id = nil
        @post.valid?
        expect(@post.errors.full_messages).to include 'ジャンルを選択してください'
      end
      it 'gender_idが1だと登録できない' do
        @post.gender_id = '1'
        @post.valid?
        expect(@post.errors.full_messages).to include 'ジャンルを選択してください'
      end
    end
  end
end
