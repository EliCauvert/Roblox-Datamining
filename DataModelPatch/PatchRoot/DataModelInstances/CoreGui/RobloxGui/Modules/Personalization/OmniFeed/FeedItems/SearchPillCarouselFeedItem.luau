local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local TopicInfosReducer = require(CorePackages.Workspace.Packages.TopicInfosRodux).TopicInfosReducer
local TopicContentsReducer = require(CorePackages.Workspace.Packages.TopicContentsRodux).TopicContentsReducer
local OmniFeedProps = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules.Personalization.OmniFeed.OmniFeedProps
local SearchPillCarouselModule = require(game:GetService("CoreGui").RobloxGui.Modules.Personalization.Search.SearchPillCarousel)

function SearchPillCarouselFeedItem(p1)
	-- upvalues: OmniFeedProps (copy), UseSelectorFunction (copy), TopicInfosReducer (copy), TopicContentsReducer (copy), ReactModule (copy), SearchPillCarouselModule (copy)
	local v1 = p1[OmniFeedProps.key]
	local AppPage = v1.appPage
	local UseSelectorResult = UseSelectorFunction(function(p2)
		-- upvalues: AppPage (copy)
		return p2.Personalization.OrderedOmniItems[AppPage]
	end)
	local UseSelectorResult1 = UseSelectorFunction(function(p2)
		-- upvalues: TopicInfosReducer (upval)
		return p2.Personalization[TopicInfosReducer.key]
	end)
	local UseSelectorResult2 = UseSelectorFunction(function(p2)
		-- upvalues: TopicContentsReducer (upval)
		return p2.Personalization[TopicContentsReducer.key]
	end)
	local AllItem = UseSelectorResult.allItems[p1.sortIndex]
	
	if not AllItem then
		warn(`no omni item found for index: {p1.sortIndex}`)
		
		return nil
	end
	local SortName = AllItem.treatmentProps.sortName
	
	if not SortName then
		warn(`no sort name found for index: {p1.sortIndex}`)
		
		return nil
	end
	local UseSelectorResultEntry = UseSelectorResult1[SortName]
	
	if not UseSelectorResultEntry then
		warn(`no topic info found for sort: {SortName}`)
		
		return nil
	end
	local DisplayName = UseSelectorResultEntry.displayName
	
	if not DisplayName then
		warn(`no display name found for sort: {SortName}`)
		
		return nil
	end
	local UseSelectorResultEntry1 = UseSelectorResult2[SortName]
	
	if not UseSelectorResultEntry1 then
		warn(`no topic contents found for sort: {SortName}`)
		
		return nil
	end
	local Entries = UseSelectorResultEntry1.entries
	
	if Entries then
		return (ReactModule.createElement(SearchPillCarouselModule, {
			entries = Entries,
			headerText = DisplayName,
			pageContext = AppPage,
			sortIndex = p1.sortIndex,
			sortName = SortName,
			scrollViewPositionChangedSignal = v1.scrollViewPositionChangedSignal,
			verticalScrollingFrameRef = v1.verticalScrollingFrameRef
		}))
	else
		warn(`no sort entries found for sort: {SortName}`)
		
		return nil
	end
end

return SearchPillCarouselFeedItem