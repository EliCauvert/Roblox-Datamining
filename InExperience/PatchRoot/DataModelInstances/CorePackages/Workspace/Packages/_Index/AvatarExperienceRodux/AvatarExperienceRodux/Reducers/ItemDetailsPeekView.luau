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
	[setItemDetailsPeekViewStateModule.name] = function(p2, p3)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p2, { viewState = p3.viewState })
	end,
	[setItemTryOnPeekViewStateModule.name] = function(p4, p5)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p4, { tryOnViewState = p5.viewState })
	end,
	[setTryOnManagerPeekViewStateModule.name] = function(p6, p7)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p6, { tryOnManagerViewState = p7.viewState })
	end,
	[setLookDetailsPeekViewSelectedTabModule.name] = function(p8, p9)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p8, { lookDetailsSelectedTab = p9.selectedTab })
	end,
	[avatarExperienceCommonModule.State.Actions.CharacterHistoryStateChangeButtonActivated.name] = function(p10, p11)
		-- upvalues: cryoModule (ref), peekViewState (ref)
		if not p11.tryOn or not p11.tryOn.OutfitTryOn then
			return p10
		end
		local lookId = p11.tryOn.OutfitTryOn.LookId
		local var9 = lookId ~= nil and lookId ~= cryoModule.None
		
		return cryoModule.Dictionary.join(p10, {
			tryOnManagerViewState = if var9 and p10.tryOnManagerViewState == peekViewState.Closed then peekViewState.SuperBrief elseif not var9 and p10.tryOnManagerViewState ~= peekViewState.Closed then peekViewState.Closed else p10.tryOnManagerViewState
		})
	end
}) else function(p0, p1)
	-- upvalues: peekViewState (ref), setItemDetailsPeekViewStateModule (ref), cryoModule (ref), setItemTryOnPeekViewStateModule (ref), setTryOnManagerPeekViewStateModule (ref), setLookDetailsPeekViewSelectedTabModule (ref)
	p0 = p0 or {
		lookDetailsSelectedTab = 2,
		viewState = peekViewState.Closed,
		tryOnViewState = peekViewState.Closed,
		tryOnManagerViewState = peekViewState.Closed
	}
	
	if p1.type == setItemDetailsPeekViewStateModule.name then
		p0 = cryoModule.Dictionary.join(p0, { viewState = p1.viewState })
		
		return p0
	elseif p1.type == setItemTryOnPeekViewStateModule.name then
		p0 = cryoModule.Dictionary.join(p0, { tryOnViewState = p1.viewState })
		
		return p0
	elseif p1.type == setTryOnManagerPeekViewStateModule.name then
		p0 = cryoModule.Dictionary.join(p0, { tryOnManagerViewState = p1.viewState })
		
		return p0
	elseif p1.type == setLookDetailsPeekViewSelectedTabModule.name then
		p0 = cryoModule.Dictionary.join(p0, { lookDetailsSelectedTab = p1.selectedTab })
	end
	return p0
end