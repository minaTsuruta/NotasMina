
name = %w{
    Ruby
    JavaScript
    その他
    }

3.times do |m|
    n = name[m]
    Category.create!(
        name: n,
        created_at: DateTime.now,
        updated_at: DateTime.now
    )
end