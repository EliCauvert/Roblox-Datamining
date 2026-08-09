local momentStatus = require(script:FindFirstAncestor("DataHydration").Parent.MomentsTypes).Enums.MomentStatus
local list = {
	{ placeId = 185655149, universeId = 8357232245 },
	{ placeId = 920587237, universeId = 245662005 },
	{ placeId = 6516141723, universeId = 2440500276 },
	{ placeId = 4924922222, universeId = 1685831367 }
}
local list_1 = {
	9113446962, 1062804083, 10067664364, 11045762650, 3358829679, 2649867028,
	7715672989, 3617978804, 10378728341, 10790642201, 2539415890
}
local list_2 = {
	5608386285, 5608368298, 5670824523, 5608370112, 5608330602, 5608310319,
	5670809466, 5608327482, 5608304953, 5608281849
}
local list_3 = {
	8508980527, 109251559, 78447821, 595029580, 394647606, 68073547, 3537138
}
local list_4 = { 1848354536, 5410086218, 139180277700549, 139434270800490 }
local list_5 = {
	"first try, no way", "we actually cooked today", "had to clip this one",
	"caught it in 4k", "POV: the plan finally worked", "blink and you'll miss it",
	"best run i've had", "ok that was actually clean", "10/10 would run it back",
	"real ones were here", "the comeback nobody saw coming", "saving this forever",
	"certified moment fr", "me when it all comes together",
	"took way too many tries", "we move regardless", "outplayed and not sorry",
	"this one's going in the highlights", "trust the process they said",
	"peak gameplay right here"
}

local function _(p0) --[[ line: 123 | named "rngFor" ]]
	return Random.new(p0 * 2654435761 + 2026)
end

local _ = function(p1, p2) --[[ line: 127 | named "cycle" ]]
	return p1[(p2 - 1) % #p1 + 1]
end

local function makeMomentFeedItem(p3) --[[ line: 133 ]]
	-- upvalues: list_5 (ref), list (ref), list_1 (ref), list_4 (ref), list_3 (ref), list_2 (ref), momentStatus (ref)
	local t
	local random = Random.new(p3 * 2654435761 + 2026)
	local var8 = p3 > 1 and random:NextNumber() < 0.28
	local var9 = list_5[random:NextInteger(1, #list_5)]
	local var10 = list[random:NextInteger(1, #list)]
	local var11 = list_1[random:NextInteger(1, #list_1)]
	local var12 = random:NextInteger(0, 12)
	
	if #list_4 > 0 and (var8 or random:NextNumber() < 0.45) then
		t = {}
		local var14 = list_4
		t.assetId = var14[(p3 - 1) % #var14 + 1]
		t.startTime = var12
	else
		t = nil
	end
	local var16
	if var8 then
		local var15 = list_3
		var16 = var15[(p3 - 1) % #var15 + 1]
	else
		local var17 = list_2
		var16 = var17[(p3 - 1) % #var17 + 1]
	end
	return {
		kind = "moment",
		moment = {
			isModerated = false,
			assetId = var16,
			creatorId = var11,
			momentId = `mock-moment-{p3}`,
			status = momentStatus.Public,
			metadata = {
				assetTotalDuration = 10,
				captureType = if var8 then Enum.CaptureType.Screenshot else Enum.CaptureType.Video,
				description = var9,
				placeId = var10.placeId,
				universeId = var10.universeId,
				edits = { music = t }
			},
			recommendationMetadata = {
				configName = "MaximizeJoins",
				locationId = "Trending",
				itemId = `mock-item-{p3}`,
				tracingId = `mock-trace-{p3}`
			}
		}
	}
end

return {
	makeMomentFeedItem = makeMomentFeedItem,
	buildMomentFeedItems = function(p4, p5) --[[ line: 217 ]]
		-- upvalues: makeMomentFeedItem (ref)
		local t = {}
		
		for i = 0, p5 - 1 do
			table.insert(t, makeMomentFeedItem(p4 + i))
		end
		return t
	end
}