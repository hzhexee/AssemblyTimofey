;==========================================
; ОБЪЯВЛЕНИЕ ПЕРЕМЕННЫХ И СТРУКТУРА ДАННЫХ
;==========================================
; Программа вычисляет выражение (a+b+c)+(d-e) с вводом переменных от пользователя
;
; Компиляция и сборка:
;   nasm -f elf 23.asm -o 23.o
;   gcc -m32 23.o -o 23
;
; Запуск: ./23
section .data
    prompt_a db "Введите a: ", 0    ; Сообщение для запроса ввода переменной a
    prompt_b db "Введите b: ", 0    ; Сообщение для запроса ввода переменной b
    prompt_c db "Введите c: ", 0    ; Сообщение для запроса ввода переменной c
    prompt_d db "Введите d: ", 0    ; Сообщение для запроса ввода переменной d
    prompt_e db "Введите e: ", 0    ; Сообщение для запроса ввода переменной e
    result_msg db "Результат (a+b+c)+(d-e) = ", 0    ; Сообщение для вывода результата
    error_msg db "Ошибка: введите число, а не текст!", 10, 0    ; Сообщение об ошибке ввода
    format_in db "%d", 0    ; Формат для scanf - целое число
    format_out db "%d", 10, 0  ; Формат для printf - целое число с переводом строки

section .bss
    a resd 1    ; Резервируем 4 байта для переменной a
    b resd 1    ; Резервируем 4 байта для переменной b
    c resd 1    ; Резервируем 4 байта для переменной c
    d resd 1    ; Резервируем 4 байта для переменной d
    e resd 1    ; Резервируем 4 байта для переменной e
    result resd 1    ; Резервируем 4 байта для хранения результата вычисления

;==========================================
; ИСПОЛНЯЕМЫЙ КОД ПРОГРАММЫ
;==========================================
section .text
    global main    ; Объявление глобальной метки main - точки входа в программу
    extern printf  ; Импорт функции printf из стандартной библиотеки C
    extern scanf   ; Импорт функции scanf из стандартной библиотеки C
    
main:
    ;----------------------------------------
    ; БЛОК ПОДГОТОВКИ: Настройка стека
    ;----------------------------------------
    push ebp       ; Сохраняем указатель базы кадра стека
    mov ebp, esp   ; Устанавливаем новый указатель базы кадра стека
    
    ;==========================================
    ; БЛОК ВВОДА-ВЫВОДА: Ввод переменной a
    ;==========================================
    ;----------------------------------------
    ; Подблок: Вывод приглашения для ввода a
    ;----------------------------------------
    push prompt_a  ; Помещаем адрес строки приглашения в стек
    call printf    ; Вызываем функцию printf для вывода приглашения
    add esp, 4     ; Очищаем стек после вызова функции (удаляем 1 параметр)
    
    ;----------------------------------------
    ; Подблок: Считывание значения a
    ;----------------------------------------
    push a         ; Помещаем адрес переменной a в стек
    push format_in ; Помещаем формат ввода в стек
    call scanf     ; Вызываем функцию scanf для чтения ввода
    add esp, 8     ; Очищаем стек после вызова функции (удаляем 2 параметра)
    
    ;----------------------------------------
    ; Подблок: Проверка успешности ввода
    ;----------------------------------------
    cmp eax, 1     ; Сравниваем возвращаемое значение scanf с 1 (успешное чтение)
    jne input_error ; Если не равно 1, переходим к обработке ошибки ввода
    
    ;==========================================
    ; БЛОК ВВОДА-ВЫВОДА: Ввод переменной b
    ;==========================================
    ;----------------------------------------
    ; Подблок: Вывод приглашения для ввода b
    ;----------------------------------------
    push prompt_b  ; Помещаем адрес строки приглашения в стек
    call printf    ; Вызываем функцию printf для вывода приглашения
    add esp, 4     ; Очищаем стек после вызова функции
    
    ;----------------------------------------
    ; Подблок: Считывание значения b
    ;----------------------------------------
    push b         ; Помещаем адрес переменной b в стек
    push format_in ; Помещаем формат ввода в стек
    call scanf     ; Вызываем функцию scanf для чтения ввода
    add esp, 8     ; Очищаем стек после вызова функции
    
    ;----------------------------------------
    ; Подблок: Проверка успешности ввода
    ;----------------------------------------
    cmp eax, 1     ; Сравниваем возвращаемое значение scanf с 1
    jne input_error ; Если не равно 1, переходим к обработке ошибки ввода
    
    ;==========================================
    ; БЛОК ВВОДА-ВЫВОДА: Ввод переменной c
    ;==========================================
    ;----------------------------------------
    ; Подблок: Вывод приглашения для ввода c
    ;----------------------------------------
    push prompt_c  ; Помещаем адрес строки приглашения в стек
    call printf    ; Вызываем функцию printf для вывода приглашения
    add esp, 4     ; Очищаем стек после вызова функции
    
    ;----------------------------------------
    ; Подблок: Считывание значения c
    ;----------------------------------------
    push c         ; Помещаем адрес переменной c в стек
    push format_in ; Помещаем формат ввода в стек
    call scanf     ; Вызываем функцию scanf для чтения ввода
    add esp, 8     ; Очищаем стек после вызова функции
    
    ;----------------------------------------
    ; Подблок: Проверка успешности ввода
    ;----------------------------------------
    cmp eax, 1     ; Сравниваем возвращаемое значение scanf с 1
    jne input_error ; Если не равно 1, переходим к обработке ошибки ввода
    
    ;==========================================
    ; БЛОК ВВОДА-ВЫВОДА: Ввод переменной d
    ;==========================================
    ;----------------------------------------
    ; Подблок: Вывод приглашения для ввода d
    ;----------------------------------------
    push prompt_d  ; Помещаем адрес строки приглашения в стек
    call printf    ; Вызываем функцию printf для вывода приглашения
    add esp, 4     ; Очищаем стек после вызова функции
    
    ;----------------------------------------
    ; Подблок: Считывание значения d
    ;----------------------------------------
    push d         ; Помещаем адрес переменной d в стек
    push format_in ; Помещаем формат ввода в стек
    call scanf     ; Вызываем функцию scanf для чтения ввода
    add esp, 8     ; Очищаем стек после вызова функции
    
    ;----------------------------------------
    ; Подблок: Проверка успешности ввода
    ;----------------------------------------
    cmp eax, 1     ; Сравниваем возвращаемое значение scanf с 1
    jne input_error ; Если не равно 1, переходим к обработке ошибки ввода
    
    ;==========================================
    ; БЛОК ВВОДА-ВЫВОДА: Ввод переменной e
    ;==========================================
    ;----------------------------------------
    ; Подблок: Вывод приглашения для ввода e
    ;----------------------------------------
    push prompt_e  ; Помещаем адрес строки приглашения в стек
    call printf    ; Вызываем функцию printf для вывода приглашения
    add esp, 4     ; Очищаем стек после вызова функции
    
    ;----------------------------------------
    ; Подблок: Считывание значения e
    ;----------------------------------------
    push e         ; Помещаем адрес переменной e в стек
    push format_in ; Помещаем формат ввода в стек
    call scanf     ; Вызываем функцию scanf для чтения ввода
    add esp, 8     ; Очищаем стек после вызова функции
    
    ;----------------------------------------
    ; Подблок: Проверка успешности ввода
    ;----------------------------------------
    cmp eax, 1     ; Сравниваем возвращаемое значение scanf с 1
    jne input_error ; Если не равно 1, переходим к обработке ошибки ввода
    
    ;==========================================
    ; БЛОК ВЫЧИСЛЕНИЙ: Расчет выражения (a+b+c)+(d-e)
    ; Вычисляет значение указанного выражения, используя регистры
    ;==========================================
    mov eax, [a]      ; Загружаем значение a в регистр eax
    add eax, [b]      ; Добавляем значение b к eax (eax = a + b)
    add eax, [c]      ; Добавляем значение c к eax (eax = a + b + c)
    mov ebx, [d]      ; Загружаем значение d в регистр ebx
    sub ebx, [e]      ; Вычитаем значение e из ebx (ebx = d - e)
    add eax, ebx      ; Добавляем ebx к eax (eax = (a + b + c) + (d - e))
    mov [result], eax ; Сохраняем результат в переменную result
    
    ;==========================================
    ; БЛОК ВЫВОДА РЕЗУЛЬТАТОВ
    ; Выводит результат вычисления
    ;==========================================
    ;----------------------------------------
    ; Подблок: Вывод сообщения о результате
    ;----------------------------------------
    push result_msg   ; Помещаем адрес сообщения о результате в стек
    call printf       ; Вызываем функцию printf для вывода сообщения
    add esp, 4        ; Очищаем стек после вызова функции
    
    ;----------------------------------------
    ; Подблок: Вывод значения результата
    ;----------------------------------------
    push dword [result] ; Помещаем значение результата в стек
    push format_out   ; Помещаем формат вывода в стек
    call printf       ; Вызываем функцию printf для вывода результата
    add esp, 8        ; Очищаем стек после вызова функции
    
    jmp exit_program  ; Переходим к завершению программы
    
    ;==========================================
    ; БЛОК ОБРАБОТКИ ОШИБОК
    ; Обрабатывает ошибки ввода
    ;==========================================
input_error:
    ;----------------------------------------
    ; Подблок: Вывод сообщения об ошибке
    ;----------------------------------------
    push error_msg    ; Помещаем адрес сообщения об ошибке в стек
    call printf       ; Вызываем функцию printf для вывода сообщения
    add esp, 4        ; Очищаем стек после вызова функции
    
    ;==========================================
    ; БЛОК ЗАВЕРШЕНИЯ ПРОГРАММЫ
    ; Корректно завершает программу с кодом выхода 0
    ;==========================================
exit_program:
    ;----------------------------------------
    ; Подблок: Восстановление стека и возврат из программы
    ;----------------------------------------
    mov esp, ebp      ; Восстанавливаем указатель стека
    pop ebp           ; Восстанавливаем сохраненное значение базового указателя
    xor eax, eax      ; Устанавливаем код возврата 0 (успешное завершение)
    ret               ; Возврат из программы
