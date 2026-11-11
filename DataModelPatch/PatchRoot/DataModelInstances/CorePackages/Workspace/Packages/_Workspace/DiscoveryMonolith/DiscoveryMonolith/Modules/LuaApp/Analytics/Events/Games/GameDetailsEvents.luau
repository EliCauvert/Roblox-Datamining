local Players = game:GetService("Players")
local Parent = script:FindFirstAncestor("DiscoveryMonolith").Parent
local Immutable = require(Parent.AppCommonLib).Immutable
local FFlagMediaAccordionAndFullTelemetry = require(Parent.SharedFlags).FFlagMediaAccordionAndFullTelemetry
local FFlagLuaAppDesktopMediaGalleryTelemetry = require(Parent.SharedFlags).FFlagLuaAppDesktopMediaGalleryTelemetry
local FFlagLuaAppEdpMediaGalleryRedesignTelemetry = require(Parent.SharedFlags).FFlagLuaAppEdpMediaGalleryRedesignTelemetry
local FFlagLuaAppAddUniverseIdToGameDetailsEvents = require(Parent.SharedFlags).FFlagLuaAppAddUniverseIdToGameDetailsEvents

local function _(p1)
	-- upvalues: Players (copy), Immutable (copy)
	return function(p2, p3, PlaceId, JoinDictionariesResult)
		-- upvalues: Players (upval), Immutable (upval), p1 (copy)
		assert(type(p3) == "string", "Expected eventContext to be a string")
		assert(type(PlaceId) == "string", "Expected placeId to be a string")
		assert(type(JoinDictionariesResult) == "table", "Expected state to be a table")
		p2:setRBXEventStream(p3, p1, (Immutable.JoinDictionaries({
			uid = tostring(Players.LocalPlayer.UserId),
			placeId = PlaceId
		}, JoinDictionariesResult)))
	end
end

local _ = function(p1)
	-- upvalues: Players (copy), Immutable (copy)
	local function v63(p2, p3, PlaceId, JoinDictionariesResult)
		-- upvalues: Players (upval), Immutable (upval), p1 (copy)
		assert(type(p3) == "string", "Expected eventContext to be a string")
		assert(type(PlaceId) == "string", "Expected placeId to be a string")
		assert(type(JoinDictionariesResult) == "table", "Expected state to be a table")
		p2:setRBXEventStream(p3, p1, (Immutable.JoinDictionaries({
			uid = tostring(Players.LocalPlayer.UserId),
			placeId = PlaceId
		}, JoinDictionariesResult)))
	end
	
	return function(p2, p3, PlaceId, p4, p5)
		-- upvalues: Immutable (upval), v63 (copy)
		assert(type(p4) == "boolean", "Expected state to be a boolean")
		
		if p5 ~= nil then
			assert(type(p5) == "table", "Expected extraData to be a table")
		end
		return v63(p2, p3, PlaceId, (Immutable.JoinDictionaries(p5 or {}, { state = if p4 then "on" else "off" })))
	end
end

local _ = function(p1)
	-- upvalues: Players (copy), Immutable (copy)
	local function v64(p2, p3, PlaceId, JoinDictionariesResult)
		-- upvalues: Players (upval), Immutable (upval), p1 (copy)
		assert(type(p3) == "string", "Expected eventContext to be a string")
		assert(type(PlaceId) == "string", "Expected placeId to be a string")
		assert(type(JoinDictionariesResult) == "table", "Expected state to be a table")
		p2:setRBXEventStream(p3, p1, (Immutable.JoinDictionaries({
			uid = tostring(Players.LocalPlayer.UserId),
			placeId = PlaceId
		}, JoinDictionariesResult)))
	end
	
	return function(p2, p3, PlaceId, p4)
		-- upvalues: v64 (copy)
		return v64(p2, p3, PlaceId, p4 or {})
	end
end

local v1 = "copyExperienceLink"

local function v11(p1, p2, PlaceId, JoinDictionariesResult)
	-- upvalues: Players (copy), Immutable (copy), v1 (copy)
	assert(type(p2) == "string", "Expected eventContext to be a string")
	assert(type(PlaceId) == "string", "Expected placeId to be a string")
	assert(type(JoinDictionariesResult) == "table", "Expected state to be a table")
	p1:setRBXEventStream(p2, v1, (Immutable.JoinDictionaries({
		uid = tostring(Players.LocalPlayer.UserId),
		placeId = PlaceId
	}, JoinDictionariesResult)))
end

local function CopyExperienceLink(p1, p2, PlaceId, p3)
	-- upvalues: v11 (copy)
	return v11(p1, p2, PlaceId, p3 or {})
end

local v2 = "favorite"

local function v14(p1, p2, PlaceId, JoinDictionariesResult)
	-- upvalues: Players (copy), Immutable (copy), v2 (copy)
	assert(type(p2) == "string", "Expected eventContext to be a string")
	assert(type(PlaceId) == "string", "Expected placeId to be a string")
	assert(type(JoinDictionariesResult) == "table", "Expected state to be a table")
	p1:setRBXEventStream(p2, v2, (Immutable.JoinDictionaries({
		uid = tostring(Players.LocalPlayer.UserId),
		placeId = PlaceId
	}, JoinDictionariesResult)))
end

local function Favorite(p1, p2, PlaceId, p3, p4)
	-- upvalues: Immutable (copy), v14 (copy)
	assert(type(p3) == "boolean", "Expected state to be a boolean")
	
	if p4 ~= nil then
		assert(type(p4) == "table", "Expected extraData to be a table")
	end
	return v14(p1, p2, PlaceId, (Immutable.JoinDictionaries(p4 or {}, { state = if p3 then "on" else "off" })))
end

local v3 = "follow"

local function v17(p1, p2, PlaceId, JoinDictionariesResult)
	-- upvalues: Players (copy), Immutable (copy), v3 (copy)
	assert(type(p2) == "string", "Expected eventContext to be a string")
	assert(type(PlaceId) == "string", "Expected placeId to be a string")
	assert(type(JoinDictionariesResult) == "table", "Expected state to be a table")
	p1:setRBXEventStream(p2, v3, (Immutable.JoinDictionaries({
		uid = tostring(Players.LocalPlayer.UserId),
		placeId = PlaceId
	}, JoinDictionariesResult)))
end

local function Follow(p1, p2, PlaceId, p3, p4)
	-- upvalues: Immutable (copy), v17 (copy)
	assert(type(p3) == "boolean", "Expected state to be a boolean")
	
	if p4 ~= nil then
		assert(type(p4) == "table", "Expected extraData to be a table")
	end
	return v17(p1, p2, PlaceId, (Immutable.JoinDictionaries(p4 or {}, { state = if p3 then "on" else "off" })))
end

local v4 = "navigateToInviteFriends"

local function v20(p1, p2, PlaceId, JoinDictionariesResult)
	-- upvalues: Players (copy), Immutable (copy), v4 (copy)
	assert(type(p2) == "string", "Expected eventContext to be a string")
	assert(type(PlaceId) == "string", "Expected placeId to be a string")
	assert(type(JoinDictionariesResult) == "table", "Expected state to be a table")
	p1:setRBXEventStream(p2, v4, (Immutable.JoinDictionaries({
		uid = tostring(Players.LocalPlayer.UserId),
		placeId = PlaceId
	}, JoinDictionariesResult)))
end

local function ShareGameToChat(p1, p2, PlaceId, p3)
	-- upvalues: v20 (copy)
	return v20(p1, p2, PlaceId, p3 or {})
end

local v5 = "openMore"

local function v23(p1, p2, PlaceId, JoinDictionariesResult)
	-- upvalues: Players (copy), Immutable (copy), v5 (copy)
	assert(type(p2) == "string", "Expected eventContext to be a string")
	assert(type(PlaceId) == "string", "Expected placeId to be a string")
	assert(type(JoinDictionariesResult) == "table", "Expected state to be a table")
	p1:setRBXEventStream(p2, v5, (Immutable.JoinDictionaries({
		uid = tostring(Players.LocalPlayer.UserId),
		placeId = PlaceId
	}, JoinDictionariesResult)))
end

local function OpenMore(p1, p2, PlaceId, p3)
	-- upvalues: v23 (copy)
	return v23(p1, p2, PlaceId, p3 or {})
end

local v6 = "openGameDetailsPT"

local function v26(p1, p2, PlaceId, JoinDictionariesResult)
	-- upvalues: Players (copy), Immutable (copy), v6 (copy)
	assert(type(p2) == "string", "Expected eventContext to be a string")
	assert(type(PlaceId) == "string", "Expected placeId to be a string")
	assert(type(JoinDictionariesResult) == "table", "Expected state to be a table")
	p1:setRBXEventStream(p2, v6, (Immutable.JoinDictionaries({
		uid = tostring(Players.LocalPlayer.UserId),
		placeId = PlaceId
	}, JoinDictionariesResult)))
end

local function OpenPlayTogether(p1, p2, PlaceId, p3)
	-- upvalues: v26 (copy)
	return v26(p1, p2, PlaceId, p3 or {})
end

local v7 = "createPrivateGame"

local function v29(p1, p2, PlaceId, JoinDictionariesResult)
	-- upvalues: Players (copy), Immutable (copy), v7 (copy)
	assert(type(p2) == "string", "Expected eventContext to be a string")
	assert(type(PlaceId) == "string", "Expected placeId to be a string")
	assert(type(JoinDictionariesResult) == "table", "Expected state to be a table")
	p1:setRBXEventStream(p2, v7, (Immutable.JoinDictionaries({
		uid = tostring(Players.LocalPlayer.UserId),
		placeId = PlaceId
	}, JoinDictionariesResult)))
end

local function CreatePrivateGame(p1, p2, PlaceId, p3)
	-- upvalues: v29 (copy)
	return v29(p1, p2, PlaceId, p3 or {})
end

local v8 = "joinFriendsInGame"

local function v32(p1, p2, PlaceId, JoinDictionariesResult)
	-- upvalues: Players (copy), Immutable (copy), v8 (copy)
	assert(type(p2) == "string", "Expected eventContext to be a string")
	assert(type(PlaceId) == "string", "Expected placeId to be a string")
	assert(type(JoinDictionariesResult) == "table", "Expected state to be a table")
	p1:setRBXEventStream(p2, v8, (Immutable.JoinDictionaries({
		uid = tostring(Players.LocalPlayer.UserId),
		placeId = PlaceId
	}, JoinDictionariesResult)))
end

local function JoinFriendsInGame(p1, p2, PlaceId, p3)
	-- upvalues: v32 (copy)
	return v32(p1, p2, PlaceId, p3 or {})
end

local v9 = "shareExperienceLink"

local function v35(p1, p2, PlaceId, JoinDictionariesResult)
	-- upvalues: Players (copy), Immutable (copy), v9 (copy)
	assert(type(p2) == "string", "Expected eventContext to be a string")
	assert(type(PlaceId) == "string", "Expected placeId to be a string")
	assert(type(JoinDictionariesResult) == "table", "Expected state to be a table")
	p1:setRBXEventStream(p2, v9, (Immutable.JoinDictionaries({
		uid = tostring(Players.LocalPlayer.UserId),
		placeId = PlaceId
	}, JoinDictionariesResult)))
end

local function ShareExperienceLink(p1, p2, PlaceId, p3)
	-- upvalues: v35 (copy)
	return v35(p1, p2, PlaceId, p3 or {})
end

local v10 = "requestRefundClick"

local function v38(p1, p2, PlaceId, JoinDictionariesResult)
	-- upvalues: Players (copy), Immutable (copy), v10 (copy)
	assert(type(p2) == "string", "Expected eventContext to be a string")
	assert(type(PlaceId) == "string", "Expected placeId to be a string")
	assert(type(JoinDictionariesResult) == "table", "Expected state to be a table")
	p1:setRBXEventStream(p2, v10, (Immutable.JoinDictionaries({
		uid = tostring(Players.LocalPlayer.UserId),
		placeId = PlaceId
	}, JoinDictionariesResult)))
end

local function RequestRefundClick(p1, p2, PlaceId, p3)
	-- upvalues: v38 (copy)
	return v38(p1, p2, PlaceId, p3 or {})
end

local v11 = "mediaGalleryActivated"

local function v41(p1, p2, PlaceId, JoinDictionariesResult)
	-- upvalues: Players (copy), Immutable (copy), v11 (copy)
	assert(type(p2) == "string", "Expected eventContext to be a string")
	assert(type(PlaceId) == "string", "Expected placeId to be a string")
	assert(type(JoinDictionariesResult) == "table", "Expected state to be a table")
	p1:setRBXEventStream(p2, v11, (Immutable.JoinDictionaries({
		uid = tostring(Players.LocalPlayer.UserId),
		placeId = PlaceId
	}, JoinDictionariesResult)))
end

local function MediaGalleryActivated(p1, p2, PlaceId, p3)
	-- upvalues: v41 (copy)
	return v41(p1, p2, PlaceId, p3 or {})
end

local v12 = "mediaGallerySwiped"

local function v44(p1, p2, PlaceId, JoinDictionariesResult)
	-- upvalues: Players (copy), Immutable (copy), v12 (copy)
	assert(type(p2) == "string", "Expected eventContext to be a string")
	assert(type(PlaceId) == "string", "Expected placeId to be a string")
	assert(type(JoinDictionariesResult) == "table", "Expected state to be a table")
	p1:setRBXEventStream(p2, v12, (Immutable.JoinDictionaries({
		uid = tostring(Players.LocalPlayer.UserId),
		placeId = PlaceId
	}, JoinDictionariesResult)))
end

local GameDetailsEventsModule = {
	CopyExperienceLink = CopyExperienceLink,
	Favorite = Favorite,
	Follow = Follow,
	ShareGameToChat = ShareGameToChat,
	GameDetailsSubpage = function(p1, p2, p3, Subpage, p4)
		-- upvalues: Players (copy), Immutable (copy), FFlagLuaAppAddUniverseIdToGameDetailsEvents (copy)
		local v13 = "gameDetailsSubpage";
		(function(p5, p6, PlaceId, JoinDictionariesResult)
			-- upvalues: Players (upval), Immutable (upval), v13 (copy)
			assert(type(p6) == "string", "Expected eventContext to be a string")
			assert(type(PlaceId) == "string", "Expected placeId to be a string")
			assert(type(JoinDictionariesResult) == "table", "Expected state to be a table")
			p5:setRBXEventStream(p6, v13, (Immutable.JoinDictionaries({
				uid = tostring(Players.LocalPlayer.UserId),
				placeId = PlaceId
			}, JoinDictionariesResult)))
		end)(p1, p2, p3, {
			subpage = Subpage,
			universeId = if FFlagLuaAppAddUniverseIdToGameDetailsEvents then p4 else nil
		})
	end,
	Vote = function(p1, p2, p3, Vote, PrevVote)
		-- upvalues: Players (copy), Immutable (copy)
		local v13 = "vote";
		(function(p4, p5, PlaceId, JoinDictionariesResult)
			-- upvalues: Players (upval), Immutable (upval), v13 (copy)
			assert(type(p5) == "string", "Expected eventContext to be a string")
			assert(type(PlaceId) == "string", "Expected placeId to be a string")
			assert(type(JoinDictionariesResult) == "table", "Expected state to be a table")
			p4:setRBXEventStream(p5, v13, (Immutable.JoinDictionaries({
				uid = tostring(Players.LocalPlayer.UserId),
				placeId = PlaceId
			}, JoinDictionariesResult)))
		end)(p1, p2, p3, { vote = Vote, prevVote = PrevVote })
	end,
	OpenMore = OpenMore,
	OpenPlayTogether = OpenPlayTogether,
	CreatePrivateGame = CreatePrivateGame,
	JoinFriendsInGame = JoinFriendsInGame,
	ShareExperienceLink = ShareExperienceLink,
	RequestRefundClick = RequestRefundClick,
	MediaGalleryActivated = MediaGalleryActivated,
	MediaGallerySwiped = function(p1, p2, PlaceId, p3)
		-- upvalues: v44 (copy)
		return v44(p1, p2, PlaceId, p3 or {})
	end
}

if FFlagMediaAccordionAndFullTelemetry then
	local v13 = "mediaGalleryFullViewClosed"
	
	local function v46(p1, p2, PlaceId, JoinDictionariesResult)
		-- upvalues: Players (copy), Immutable (copy), v13 (copy)
		assert(type(p2) == "string", "Expected eventContext to be a string")
		assert(type(PlaceId) == "string", "Expected placeId to be a string")
		assert(type(JoinDictionariesResult) == "table", "Expected state to be a table")
		p1:setRBXEventStream(p2, v13, (Immutable.JoinDictionaries({
			uid = tostring(Players.LocalPlayer.UserId),
			placeId = PlaceId
		}, JoinDictionariesResult)))
	end
	
	local function MediaGalleryClosed(p1, p2, PlaceId, p3)
		-- upvalues: v46 (copy)
		return v46(p1, p2, PlaceId, p3 or {})
	end
else
	local MediaGalleryClosed: ((any, any, any, any) -> any)? = nil
end
GameDetailsEventsModule.MediaGalleryClosed = MediaGalleryClosed

if FFlagLuaAppDesktopMediaGalleryTelemetry then
	local v14 = "mediaGalleryMediaChanged"
	
	local function v49(p1, p2, PlaceId, JoinDictionariesResult)
		-- upvalues: Players (copy), Immutable (copy), v14 (copy)
		assert(type(p2) == "string", "Expected eventContext to be a string")
		assert(type(PlaceId) == "string", "Expected placeId to be a string")
		assert(type(JoinDictionariesResult) == "table", "Expected state to be a table")
		p1:setRBXEventStream(p2, v14, (Immutable.JoinDictionaries({
			uid = tostring(Players.LocalPlayer.UserId),
			placeId = PlaceId
		}, JoinDictionariesResult)))
	end
	
	local function MediaGalleryMediaChanged(p1, p2, PlaceId, p3)
		-- upvalues: v49 (copy)
		return v49(p1, p2, PlaceId, p3 or {})
	end
else
	local MediaGalleryMediaChanged: ((any, any, any, any) -> any)? = nil
end
GameDetailsEventsModule.MediaGalleryMediaChanged = MediaGalleryMediaChanged

if FFlagMediaAccordionAndFullTelemetry then
	local v15 = "mediaAccordionExpanded"
	
	local function v52(p1, p2, PlaceId, JoinDictionariesResult)
		-- upvalues: Players (copy), Immutable (copy), v15 (copy)
		assert(type(p2) == "string", "Expected eventContext to be a string")
		assert(type(PlaceId) == "string", "Expected placeId to be a string")
		assert(type(JoinDictionariesResult) == "table", "Expected state to be a table")
		p1:setRBXEventStream(p2, v15, (Immutable.JoinDictionaries({
			uid = tostring(Players.LocalPlayer.UserId),
			placeId = PlaceId
		}, JoinDictionariesResult)))
	end
	
	local function MediaAccordionExpanded(p1, p2, PlaceId, p3)
		-- upvalues: v52 (copy)
		return v52(p1, p2, PlaceId, p3 or {})
	end
else
	local MediaAccordionExpanded: ((any, any, any, any) -> any)? = nil
end
GameDetailsEventsModule.MediaAccordionExpanded = MediaAccordionExpanded

if FFlagMediaAccordionAndFullTelemetry then
	local v16 = "mediaAccordionCollapsed"
	
	local function v55(p1, p2, PlaceId, JoinDictionariesResult)
		-- upvalues: Players (copy), Immutable (copy), v16 (copy)
		assert(type(p2) == "string", "Expected eventContext to be a string")
		assert(type(PlaceId) == "string", "Expected placeId to be a string")
		assert(type(JoinDictionariesResult) == "table", "Expected state to be a table")
		p1:setRBXEventStream(p2, v16, (Immutable.JoinDictionaries({
			uid = tostring(Players.LocalPlayer.UserId),
			placeId = PlaceId
		}, JoinDictionariesResult)))
	end
	
	local function MediaAccordionCollapsed(p1, p2, PlaceId, p3)
		-- upvalues: v55 (copy)
		return v55(p1, p2, PlaceId, p3 or {})
	end
else
	local MediaAccordionCollapsed: ((any, any, any, any) -> any)? = nil
end
GameDetailsEventsModule.MediaAccordionCollapsed = MediaAccordionCollapsed

if FFlagLuaAppEdpMediaGalleryRedesignTelemetry then
	local v17 = "mediaGalleryEnterFullscreen"
	
	local function v58(p1, p2, PlaceId, JoinDictionariesResult)
		-- upvalues: Players (copy), Immutable (copy), v17 (copy)
		assert(type(p2) == "string", "Expected eventContext to be a string")
		assert(type(PlaceId) == "string", "Expected placeId to be a string")
		assert(type(JoinDictionariesResult) == "table", "Expected state to be a table")
		p1:setRBXEventStream(p2, v17, (Immutable.JoinDictionaries({
			uid = tostring(Players.LocalPlayer.UserId),
			placeId = PlaceId
		}, JoinDictionariesResult)))
	end
	
	local function MediaGalleryEnterFullscreen(p1, p2, PlaceId, p3)
		-- upvalues: v58 (copy)
		return v58(p1, p2, PlaceId, p3 or {})
	end
else
	local MediaGalleryEnterFullscreen: ((any, any, any, any) -> any)? = nil
end
GameDetailsEventsModule.MediaGalleryEnterFullscreen = MediaGalleryEnterFullscreen

if FFlagLuaAppEdpMediaGalleryRedesignTelemetry then
	local v18 = "mediaGalleryExitFullscreen"
	
	local function v61(p1, p2, PlaceId, JoinDictionariesResult)
		-- upvalues: Players (copy), Immutable (copy), v18 (copy)
		assert(type(p2) == "string", "Expected eventContext to be a string")
		assert(type(PlaceId) == "string", "Expected placeId to be a string")
		assert(type(JoinDictionariesResult) == "table", "Expected state to be a table")
		p1:setRBXEventStream(p2, v18, (Immutable.JoinDictionaries({
			uid = tostring(Players.LocalPlayer.UserId),
			placeId = PlaceId
		}, JoinDictionariesResult)))
	end
	
	local function MediaGalleryExitFullscreen(p1, p2, PlaceId, p3)
		-- upvalues: v61 (copy)
		return v61(p1, p2, PlaceId, p3 or {})
	end
else
	local MediaGalleryExitFullscreen: ((any, any, any, any) -> any)? = nil
end
GameDetailsEventsModule.MediaGalleryExitFullscreen = MediaGalleryExitFullscreen

return GameDetailsEventsModule