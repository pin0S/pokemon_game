require_relative '../models/user_database'


describe 'check usernames' do
    it 'should return if the username exists or not' do
        user = check_for_username('Peter', 3333) 
        expect('That name is already taken please try another name')
    end
    it 'should enter username if it doesn\'t exists' do
        new_user = check_for_username('Ash_K', 4444)
        expect('That name is free, entering it into the record books now')
    end
    it 'should output username not found' do
        not_existing = check_user_credentials('Brock', '2343')
        expect('username not found')
    end
    it 'should output wrong pin' do
        existing_wrong_pin = check_user_credentials('Peter', '333')
        expect('incorrect pin, try again')
    end
    it 'should output username correct pin' do
        existing_wrong_pin = check_user_credentials('Peter', '3333')
        expect('correct pin')
    end
end

describe 'Cmd line login' do
    it 'should return nil for argv' do
        cmd_args = check_user_credentials(ARGV[0], ARGV[1])
        expect(cmd_args).to eq nil
    end
end