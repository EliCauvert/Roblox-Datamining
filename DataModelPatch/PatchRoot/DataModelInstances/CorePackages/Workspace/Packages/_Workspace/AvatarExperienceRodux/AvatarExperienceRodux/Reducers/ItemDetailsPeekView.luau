local AvatarExperienceRodux = script:FindFirstAncestor("AvatarExperienceRodux")
local Parent = AvatarExperienceRodux.Parent
local CryoModule = require(Parent.Cryo)
local PeekViewState = require(Parent.PeekView).PeekViewState
local RoduxModule = require(Parent.Rodux)
local SetItemDetailsPeekViewStateModule = require(AvatarExperienceRodux.Actions.SetItemDetailsPeekViewState)
local SetItemTryOnPeekViewStateModule = require(AvatarExperienceRodux.Actions.SetItemTryOnPeekViewState)
local SetTryOnManagerPeekViewStateModule = require(AvatarExperienceRodux.Actions.SetTryOnManagerPeekViewState)
local SetLookDetailsPeekViewSelectedTabModule = require(AvatarExperienceRodux.Actions.SetLookDetailsPeekViewSelectedTab)
local CharacterHistoryStateChangeButtonActivated = require(Parent.AvatarExperienceCommon).State.Actions.CharacterHistoryStateChangeButtonActivated

return if require(Parent.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag then RoduxModule.createReducer({
	lookDetailsSelectedTab = 2,
	viewState = PeekViewState.Closed,
	tryOnViewState = PeekViewState.Closed,
	tryOnManagerViewState = PeekViewState.Closed
}, {
	[SetItemDetailsPeekViewStateModule.name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { viewState = p2.viewState })
	end,
	[SetItemTryOnPeekViewStateModule.name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { tryOnViewState = p2.viewState })
	end,
	[SetTryOnManagerPeekViewStateModule.name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { tryOnManagerViewState = p2.viewState })
	end,
	[SetLookDetailsPeekViewSelectedTabModule.name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { lookDetailsSelectedTab = p2.selectedTab })
	end,
	[CharacterHistoryStateChangeButtonActivated.name] = function(p1, p2)
		-- upvalues: CryoModule (copy), PeekViewState (copy)
		if p2.tryOn and p2.tryOn.OutfitTryOn then
			local LookId = p2.tryOn.OutfitTryOn.LookId
			local IsNotLookIdMatch: boolean = LookId ~= nil and LookId ~= CryoModule.None
			local IsTryOnManagerViewStateMatch: boolean = IsNotLookIdMatch and p1.tryOnManagerViewState == PeekViewState.Closed
			local IsNotTryOnManagerViewStateMatch: boolean = not IsNotLookIdMatch and p1.tryOnManagerViewState ~= PeekViewState.Closed
			
			return CryoModule.Dictionary.join(p1, {
				tryOnManagerViewState = if IsTryOnManagerViewStateMatch then PeekViewState.SuperBrief elseif IsNotTryOnManagerViewStateMatch then PeekViewState.Closed else p1.tryOnManagerViewState
			})
		else
			return p1
		end
	end
}) else function(p1, p2)
	-- upvalues: PeekViewState (copy), SetItemDetailsPeekViewStateModule (copy), CryoModule (copy), SetItemTryOnPeekViewStateModule (copy), SetTryOnManagerPeekViewStateModule (copy), SetLookDetailsPeekViewSelectedTabModule (copy)
	local P10 = p1 or {
		lookDetailsSelectedTab = 2,
		viewState = PeekViewState.Closed,
		tryOnViewState = PeekViewState.Closed,
		tryOnManagerViewState = PeekViewState.Closed
	}
	
	if p2.type == SetItemDetailsPeekViewStateModule.name then
		P10 = CryoModule.Dictionary.join(P10, { viewState = p2.viewState })
		
		return P10
	end
	if p2.type == SetItemTryOnPeekViewStateModule.name then
		P10 = CryoModule.Dictionary.join(P10, { tryOnViewState = p2.viewState })
		
		return P10
	end
	if p2.type == SetTryOnManagerPeekViewStateModule.name then
		P10 = CryoModule.Dictionary.join(P10, { tryOnManagerViewState = p2.viewState })
		
		return P10
	end
	if p2.type == SetLookDetailsPeekViewSelectedTabModule.name then
		P10 = CryoModule.Dictionary.join(P10, { lookDetailsSelectedTab = p2.selectedTab })
	end
	return P10
end