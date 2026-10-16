local MomentStatus = require(script:FindFirstAncestor("DataHydration").Parent.MomentsTypes).Enums.MomentStatus
local list = {
	{ placeId = 185655149, universeId = 8357232245 },
	{ placeId = 920587237, universeId = 245662005 },
	{ placeId = 6516141723, universeId = 2440500276 },
	{ placeId = 4924922222, universeId = 1685831367 }
}
local list1 = {
	9113446962, 1062804083, 10067664364, 11045762650, 3358829679, 2649867028,
	7715672989, 3617978804, 10378728341, 10790642201, 2539415890
}
local list2 = {
	5608386285, 5608368298, 5670824523, 5608370112, 5608330602, 5608310319,
	5670809466, 5608327482, 5608304953, 5608281849
}
local list3 = {
	8508980527, 109251559, 78447821, 595029580, 394647606, 68073547, 3537138
}
local list4 = { 1848354536, 5410086218, 139180277700549, 139434270800490 }
local list5 = {
	"first try, no way", "we actually cooked today", "had to clip this one",
	"caught it in 4k", "POV: the plan finally worked", "blink and you'll miss it",
	"best run i've had", "ok that was actually clean", "10/10 would run it back",
	"real ones were here", "the comeback nobody saw coming", "saving this forever",
	"certified moment fr", "me when it all comes together",
	"took way too many tries", "we move regardless", "outplayed and not sorry",
	"this one's going in the highlights", "trust the process they said",
	"peak gameplay right here"
}
local list6 = {
	"rbxasset://textures/ui/Moments/Reactions/thumbs-up-large.png",
	"rbxasset://textures/ui/Moments/Reactions/heart-large.png",
	"rbxasset://textures/ui/Moments/Reactions/laugh-joy-large.png",
	"rbxasset://textures/ui/Moments/Reactions/fire-large.png",
	"rbxasset://textures/ui/Moments/Reactions/crying-large.png",
	"rbxasset://textures/ui/Moments/Reactions/skull-large.png"
}

local function _(p1: number) --[[ Line: 133 | Named "rngFor" ]]
	return Random.new(p1 * 2654435761 + 2026)
end

local _ = function(p1, p2: number) --[[ Line: 137 | Named "cycle" ]]
	return p1[(p2 - 1) % #p1 + 1]
end

local function makeMomentFeedItem(p1: number) --[[ Line: 143 ]]
	-- upvalues: list5 (copy), list (copy), list1 (copy), list4 (copy), list6 (copy), list3 (copy), list2 (copy), MomentStatus (copy)
	local _Random = Random.new(p1 * 2654435761 + 2026)
	local NextNumberResult: number = _Random:NextNumber()
	local IsNextNumberResultBelow: boolean = p1 > 1 and NextNumberResult < 0.28
	local Entry = list[_Random:NextInteger(1, #list)]
	local NextNumberResult1: number = _Random:NextNumber()
	local NextIntegerResult = _Random:NextInteger(0, 12)
	local IsNextNumberResultBelow1: boolean = #list4 > 0 and (IsNextNumberResultBelow or NextNumberResult1 < 0.45)
	
	return {
		kind = "moment",
		moment = {
			isModerated = false,
			assetId = if IsNextNumberResultBelow then list3[(p1 - 1) % #list3 + 1] else list2[(p1 - 1) % #list2 + 1],
			creatorId = list1[_Random:NextInteger(1, #list1)],
			momentId = `mock-moment-{p1}`,
			status = MomentStatus.Public,
			metadata = {
				assetTotalDuration = 10,
				captureType = if IsNextNumberResultBelow then Enum.CaptureType.Screenshot else Enum.CaptureType.Video,
				description = list5[_Random:NextInteger(1, #list5)],
				placeId = Entry.placeId,
				universeId = Entry.universeId,
				edits = {
					music = if IsNextNumberResultBelow1 then {
						assetId = list4[(p1 - 1) % #list4 + 1],
						startTime = NextIntegerResult
					} else nil,
					stickerOverlays = if _Random:NextNumber() < 0.6 then {
						{
							rotation = 0,
							scale = 1,
							zIndex = 1,
							stickerURI = list6[(p1 - 1) % #list6 + 1],
							position = UDim2.fromScale(_Random:NextNumber() * 0.6 + 0.2, _Random:NextNumber() * 0.5 + 0.25),
							stickerSize = _Random:NextInteger(50, 200)
						}
					} else nil
				}
			},
			recommendationMetadata = {
				configName = "MaximizeJoins",
				locationId = "Trending",
				feedItemId = `mock-item-{p1}`,
				tracingId = `mock-trace-{p1}`
			}
		}
	}
end

return {
	makeMomentFeedItem = makeMomentFeedItem,
	buildMomentFeedItems = function(p1: number, p2: number) --[[ Line: 245 ]]
		-- upvalues: makeMomentFeedItem (copy)
		local List = {}
		
		for i = 0, p2 - 1 do
			table.insert(List, (makeMomentFeedItem(p1 + i)))
		end
		return List
	end
}