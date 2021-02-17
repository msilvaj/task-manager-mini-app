require 'rails_helper'

RSpec.describe Task, type: :model do
  it 'Is created with default share status nil' do
    expect(Task.new.share).to eq nil
  end

  it 'Is created with default \'status\' value os 0' do
    expect(Task.new.status.to_i).to eq 0
  end

  it 'Is created with default priority of 0' do
    expect(Task.new.priority.to_i).to eq 0
  end

  scenario 'Create a new task' do
    user = User.create(email: "asdasd@gdf.com", password: "123456")
    task = Task.create(title: "Title of task", description: "Description of task", status: "complete", priority: "low", user_id: user.id)

    expect(task.title.to_s).to eq "Title of task"
  end

  
end

