local AvatarExperienceRodux = script:FindFirstAncestor("AvatarExperienceRodux")
local Parent = AvatarExperienceRodux.Parent
local CryoModule = require(Parent.Cryo)
local PeekViewState = require(Parent.PeekView).PeekViewState

return require(Parent.Rodux).createReducer({
	lookDetailsSelectedTab = 2,
	viewState = PeekViewState.Closed,
	tryOnViewState = PeekViewState.Closed,
	tryOnManagerViewState = PeekViewState.Closed
}, {
	[require(AvatarExperienceRodux.Actions.SetItemDetailsPeekViewState).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { viewState = p2.viewState })
	end,
	[require(AvatarExperienceRodux.Actions.SetItemTryOnPeekViewState).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { tryOnViewState = p2.viewState })
	end,
	[require(AvatarExperienceRodux.Actions.SetTryOnManagerPeekViewState).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { tryOnManagerViewState = p2.viewState })
	end,
	[require(AvatarExperienceRodux.Actions.SetLookDetailsPeekViewSelectedTab).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { lookDetailsSelectedTab = p2.selectedTab })
	end,
	[require(Parent.AvatarExperienceCommon).State.Actions.CharacterHistoryStateChangeButtonActivated.name] = function(p1, p2)
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
})