authorization
ensureContactInfo
	GitUser ifNil: [
		GitUser := FillInTheBlank request: 'Git user?'.
		GitUser ifNil: [ ^false ].
		GitEmail := FillInTheBlank request: 'Git email?'.
		GitEmail ifNil: [ ^false ].
		self gitCommand: 'config --local user.name "' , GitUser , '"'.
		self gitCommand: 'config --local user.email "' , GitEmail , '"'.
	].
	^ true.