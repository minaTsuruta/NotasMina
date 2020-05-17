status = %w{
    1
    2
    3
    }

3.times do |m|
    n = status[m]
    Note.create!(
        status: n
    )
end