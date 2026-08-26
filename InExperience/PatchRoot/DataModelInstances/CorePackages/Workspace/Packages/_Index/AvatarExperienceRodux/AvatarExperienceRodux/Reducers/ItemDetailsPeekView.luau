local avatarExperienceRodux = script:FindFirstAncestor("AvatarExperienceRodux")
local parent = avatarExperienceRodux.Parent
local cryoModule = require(parent.Cryo)
local peekViewState = require(parent.PeekView).PeekViewState
local avatarExperienceCommonModule = require(parent.AvatarExperienceCommon)
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local roduxModule = require(parent.Rodux)
local setItemDetailsPeekViewStateModule = require(avatarExperienceRodux.Actions.SetItemDetailsPeekViewState)
local setItemTryOnPeekViewStateModule = require(avatarExperienceRodux.Actions.SetItemTryOnPeekViewState)
local setTryOnManagerPeekViewStateModule = require(avatarExperienceRodux.Actions.SetTryOnManagerPeekViewState)
local setLookDetailsPeekViewSelectedTabModule = require(avatarExperienceRodux.Actions.SetLookDetailsPeekViewSelectedTab)

return if avatarExperienceFlagsModule.FFlagAXRootSlotBasedEditorFlag then roduxModule.createReducer({
	lookDetailsSelectedTab = 2,
	viewState = peekViewState.Closed,
	tryOnViewState = peekViewState.Closed,
	tryOnManagerViewState = peekViewState.Closed
}, {
	[setItemDetailsPeekViewStateModule.name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, { viewState = p2.viewState })
	end,
	[setItemTryOnPeekViewStateModule.name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, { tryOnViewState = p2.viewState })
	end,
	[setTryOnManagerPeekViewStateModule.name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, { tryOnManagerViewState = p2.viewState })
	end,
	[setLookDetailsPeekViewSelectedTabModule.name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, { lookDetailsSelectedTab = p2.selectedTab })
	end,
	[avatarExperienceCommonModule.State.Actions.CharacterHistoryStateChangeButtonActivated.name] = function(p1, p2)
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
}) else function(p1, p2)
	-- upvalues: peekViewState (ref), setItemDetailsPeekViewStateModule (ref), cryoModule (ref), setItemTryOnPeekViewStateModule (ref), setTryOnManagerPeekViewStateModule (ref), setLookDetailsPeekViewSelectedTabModule (ref)
	p1 = p1 or {
		lookDetailsSelectedTab = 2,
		viewState = peekViewState.Closed,
		tryOnViewState = peekViewState.Closed,
		tryOnManagerViewState = peekViewState.Closed
	}
	
	if p2.type == setItemDetailsPeekViewStateModule.name then
		p1 = cryoModule.Dictionary.join(p1, { viewState = p2.viewState })
		
		return p1
	elseif p2.type == setItemTryOnPeekViewStateModule.name then
		p1 = cryoModule.Dictionary.join(p1, { tryOnViewState = p2.viewState })
		
		return p1
	elseif p2.type == setTryOnManagerPeekViewStateModule.name then
		p1 = cryoModule.Dictionary.join(p1, { tryOnManagerViewState = p2.viewState })
		
		return p1
	elseif p2.type == setLookDetailsPeekViewSelectedTabModule.name then
		p1 = cryoModule.Dictionary.join(p1, { lookDetailsSelectedTab = p2.selectedTab })
	end
	return p1
end