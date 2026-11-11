return {
	ExperienceUnavailable = "ExperienceUnavailable",
	NetworkError = if require(script.Parent.Parent.SharedFlags).FFlagLuaAppInExperienceDetailsPrompt then "NetworkError" else nil
}