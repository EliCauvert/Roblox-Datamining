local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseSignalFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.useSignal
local UseThrottledCallbackFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.useThrottledCallback
local DashModule = require(CorePackages.Packages.Dash)
local _ = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.AvatarExperienceState)
local GetUseSelectorDeepEqualsFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals
local AXSponsoredItemsImpressionsPeriod = game:DefineFastInt("AXSponsoredItemsImpressionsPeriod", 1)

local function selectScreenSize(p1)
	return p1.ScreenSize
end

local function selectGlobalGuiInset(p1)
	return p1.GlobalGuiInset
end

local function _(p1): string
	return if p1 and p1.id and p1.type then tostring(p1.type) .. "-" .. tostring(p1.id) else ""
end

return function(p1)
	-- upvalues: UseSelectorFunction (copy), selectScreenSize (copy), GetUseSelectorDeepEqualsFunction (copy), selectGlobalGuiInset (copy), ReactModule (copy), DashModule (copy), UseThrottledCallbackFunction (copy), AXSponsoredItemsImpressionsPeriod (copy), UseSignalFunction (copy)
	local VisibleItems = p1.visibleItems
	local ScrollingFrameRef = p1.scrollingFrameRef
	local SponsoredGridRef = p1.sponsoredGridRef
	local RequestImpressionsSignal = p1.requestImpressionsSignal
	local UseSelectorResult = UseSelectorFunction(selectScreenSize, GetUseSelectorDeepEqualsFunction())
	local UseSelectorResult1 = UseSelectorFunction(selectGlobalGuiInset, GetUseSelectorDeepEqualsFunction())
	local UseRefResult = ReactModule.useRef({})
	
	local function _()
		-- upvalues: SponsoredGridRef (copy)
		if SponsoredGridRef.current then
			local Current = SponsoredGridRef.current
			
			return Current.AbsolutePosition.Y + Current.AbsoluteSize.Y / 2
		else
			return nil
		end
	end
	
	local _ = function(): boolean
		-- upvalues: ScrollingFrameRef (copy), UseSelectorResult (copy), UseSelectorResult1 (copy), SponsoredGridRef (copy)
		if not ScrollingFrameRef or not ScrollingFrameRef.current then
			return false
		end
		assert(ScrollingFrameRef, "")
		local Y = ScrollingFrameRef.current.AbsolutePosition.Y
		local YDelta = UseSelectorResult.Y - UseSelectorResult1.bottom
		local NewY = nil
		
		if SponsoredGridRef.current then
			local Current = SponsoredGridRef.current
			NewY = Current.AbsolutePosition.Y + Current.AbsoluteSize.Y / 2
		else
			NewY = nil
		end
		return if NewY and Y < NewY then NewY < YDelta else false
	end
	
	local function sendImpressions()
		-- upvalues: UseRefResult (copy), VisibleItems (copy), DashModule (upval)
		local JoinResults = {}
		local Current = UseRefResult.current
		
		for Index, visibleItem in VisibleItems do
			local Text: string = if visibleItem and visibleItem.id and visibleItem.type then tostring(visibleItem.type) .. "-" .. tostring(visibleItem.id) else ""
			
			if not Current[Text] then
				table.insert(JoinResults, (DashModule.join(visibleItem, { index = Index })))
				Current[Text] = true
			end
		end
	end
	
	UseSignalFunction(RequestImpressionsSignal, (UseThrottledCallbackFunction(function()
		-- upvalues: ScrollingFrameRef (copy), UseSelectorResult (copy), UseSelectorResult1 (copy), SponsoredGridRef (copy), sendImpressions (copy)
		local v1 = nil
		if ScrollingFrameRef and ScrollingFrameRef.current then
			assert(ScrollingFrameRef, "")
			local Y = ScrollingFrameRef.current.AbsolutePosition.Y
			local YDelta = UseSelectorResult.Y - UseSelectorResult1.bottom
			local NewY = nil
			
			if SponsoredGridRef.current then
				local Current = SponsoredGridRef.current
				NewY = Current.AbsolutePosition.Y + Current.AbsoluteSize.Y / 2
			else
				NewY = nil
			end
			v1 = if NewY and Y < NewY then NewY < YDelta else false
		else
			v1 = false
		end
		if v1 then
			sendImpressions()
		end
	end, AXSponsoredItemsImpressionsPeriod)))
	
	return nil
end