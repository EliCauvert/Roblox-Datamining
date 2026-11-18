local ExperienceStoreServerDrivenUi = script:FindFirstAncestor("ExperienceStoreServerDrivenUi")
local Parent = ExperienceStoreServerDrivenUi.Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local SduiLoadTimer = require(Parent.SduiSharedUtilities).SduiLoadTimer
local _ = require(ExperienceStoreServerDrivenUi.Utils.GameItemType)
local FetchGameItemDetailsPageIfNeededModule = require(ExperienceStoreServerDrivenUi.Api.fetchGameItemDetailsPageIfNeeded)

return function(p1, p2)
	-- upvalues: SduiLoadTimer (copy), AppPage (copy), FetchGameItemDetailsPageIfNeededModule (copy)
	local LoadTimer = SduiLoadTimer.createLoadTimer(AppPage.GameItemDetails)
	LoadTimer.start("navigate")
	FetchGameItemDetailsPageIfNeededModule(p2, LoadTimer, true)
	p1.push(AppPage.GameItemDetails, {
		itemType = p2.itemType,
		itemId = p2.itemId,
		universeId = p2.universeId,
		pageTimer = LoadTimer
	})
end