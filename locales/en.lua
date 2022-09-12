local Translations = {
	press_context = 'press ~INPUT_CONTEXT~ to make it rain',
	not_enough = 'You don\'t have enough money. Take your broke ass home',
	tipped_dancer = 'Thanks for your generous tip!',
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})