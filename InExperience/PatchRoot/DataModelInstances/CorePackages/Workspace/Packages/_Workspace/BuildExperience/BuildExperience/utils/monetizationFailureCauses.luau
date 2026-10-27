local config = {
	imageInReview = "The generated image is still under review.",
	imagePreparing = "The generated image is still being prepared.",
	imageTooLarge = "The generated image exceeds the 5 MB limit.",
	imageTimedOut = "The generated image could not be downloaded in time.",
	imageFailed = "The generated image could not be downloaded.",
	moderated = "Roblox moderation altered this product's text.",
	noUniverse = "No universe is associated with this session."
}

return {
	MESSAGES = config,
	classify = function(Text: string)
		-- upvalues: config (copy)
		if Text == nil then
			return nil
		end
		for i, value in config do
			if string.find(Text, value, 1, true) ~= nil then
				return i
			end
		end
		return nil
	end
}