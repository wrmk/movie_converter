Модель Storage к которой привязан active_storage.
При загрузке файла со стороны клиента идёт проверка что это 1) видео 2) длительность не более минуты 3) файл выбран.
Создается запись в модели и сохраняется загруженный файл. После создаётся active job который открывает запись и конвертирует загруженное видео в gif. Указан жёсткий sleep после инициализации job. В процессе выяснения как привязать action cable без авторизации пользователя чтобы отправить сконвертированное видео. Сейчас gif просто отправляется с рендером партиала через js команду.