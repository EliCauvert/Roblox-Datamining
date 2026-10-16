local MockAvatarChatService = {}
MockAvatarChatService.__index = MockAvatarChatService

function MockAvatarChatService.new(IsEnabled, EnableVoice, GetPropertyChangedSignal, GetClientFeaturesAsync) --[[ Line: 4 ]]
	-- upvalues: MockAvatarChatService (copy)
	return (setmetatable({
		IsEnabled = IsEnabled,
		EnableVoice = EnableVoice,
		GetPropertyChangedSignal = GetPropertyChangedSignal,
		GetClientFeaturesAsync = GetClientFeaturesAsync
	}, MockAvatarChatService))
end

return MockAvatarChatService