json.array! @notifications do |notification|
  json.id notification.id
  json.actor notification.actor.full_name
  json.action notification.action
  json.notifiable do #notification.notifiable
    json.type "your book"
  end
  json.url book_path(notification.notifiable.book, anchor: dom_id(notification.notifiable))

end
