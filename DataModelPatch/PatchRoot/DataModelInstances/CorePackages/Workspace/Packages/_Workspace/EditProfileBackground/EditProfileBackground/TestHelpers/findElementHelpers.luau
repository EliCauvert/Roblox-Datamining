local SocialTestHelpersModule = require(script:FindFirstAncestor("EditProfileBackground").Parent.Dev.SocialTestHelpers)
local FindElementWithAssertFunction = SocialTestHelpersModule.TestHelpers.findElementWithAssert

return {
	findTopBar = FindElementWithAssertFunction({ Name = "TopBar" }),
	findBackButton = FindElementWithAssertFunction(SocialTestHelpersModule.TestHelpers.findImageSet("icons/navigation/pushBack"))
}