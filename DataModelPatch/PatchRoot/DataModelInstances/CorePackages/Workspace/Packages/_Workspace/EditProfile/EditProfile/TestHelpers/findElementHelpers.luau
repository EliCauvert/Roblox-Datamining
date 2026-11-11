local EditProfile = script:FindFirstAncestor("EditProfile")
local SocialTestHelpersModule = require(EditProfile.Parent.Dev.SocialTestHelpers)
local FindElementWithAssertFunction = SocialTestHelpersModule.TestHelpers.findElementWithAssert

return {
	findTopBarTitle = FindElementWithAssertFunction({ Text = require(EditProfile.Common.TextKeys).Title }),
	findTopBar = FindElementWithAssertFunction({ Name = "TopBar" }),
	findBackButton = FindElementWithAssertFunction(SocialTestHelpersModule.TestHelpers.findImageSet("icons/navigation/pushBack"))
}