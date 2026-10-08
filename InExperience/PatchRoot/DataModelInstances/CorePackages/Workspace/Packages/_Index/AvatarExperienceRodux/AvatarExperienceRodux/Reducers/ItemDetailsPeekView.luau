local avatarExperienceRodux = script:FindFirstAncestor("AvatarExperienceRodux")
local parent = avatarExperienceRodux.Parent
local cryoModule = require(parent.Cryo)
local peekViewState = require(parent.PeekView).PeekViewState

return require(parent.Rodux).createReducer({
	lookDetailsSelectedTab = 2,
	viewState = peekViewState.Closed,
	tryOnViewState = peekViewState.Closed,
	tryOnManagerViewState = peekViewState.Closed
}, {
	[require(avatarExperienceRodux.Actions.SetItemDetailsPeekViewState).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, { viewState = p2.viewState })
	end,
	[require(avatarExperienceRodux.Actions.SetItemTryOnPeekViewState).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, { tryOnViewState = p2.viewState })
	end,
	[require(avatarExperienceRodux.Actions.SetTryOnManagerPeekViewState).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, { tryOnManagerViewState = p2.viewState })
	end,
	[require(avatarExperienceRodux.Actions.SetLookDetailsPeekViewSelectedTab).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, { lookDetailsSelectedTab = p2.selectedTab })
	end,
	[require(parent.AvatarExperienceCommon).State.Actions.CharacterHistoryStateChangeButtonActivated.name] = function(p1, p2)
		-- upvalues: cryoModule (ref), peekViewState (ref)
		if not p2.tryOn or not p2.tryOn.OutfitTryOn then
			return p1
		end
		local lookId = p2.tryOn.OutfitTryOn.LookId
		local var1 = lookId ~= nil and lookId ~= cryoModule.None
		
		return cryoModule.Dictionary.join(p1, {
			tryOnManagerViewState = if var1 and p1.tryOnManagerViewState == peekViewState.Closed then peekViewState.SuperBrief elseif not var1 and p1.tryOnManagerViewState ~= peekViewState.Closed then peekViewState.Closed else p1.tryOnManagerViewState
		})
	end
})