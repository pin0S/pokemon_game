require_relative '../user_database'

describe 'check usernames' do
    it 'should return if the username exists or not' do
        user = check_for_username('Peter', 3333) 
        expect('That name is already taken please try another name')
    end
    it 'should enter username if it doesn\'t exists' do
        new_user = check_for_username('Ash_K', 4444)
        expect('That name is free, entering it into the record books now')
    end
end

