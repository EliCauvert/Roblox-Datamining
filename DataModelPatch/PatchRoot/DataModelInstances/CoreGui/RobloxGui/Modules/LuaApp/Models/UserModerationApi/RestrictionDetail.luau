local TModule = require(game:GetService("CorePackages").Packages.t)
local ResultModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Result)
local RestrictionDetailModule = {
	new = function()
		return {}
	end,
	validateJson = TModule.interface({ restriction = TModule.optional(TModule.table) }),
	validateModel = TModule.interface({ restriction = TModule.table })
}

function RestrictionDetailModule.fromJsonData(p1)
	-- upvalues: RestrictionDetailModule (copy), ResultModule (copy)
	if not RestrictionDetailModule.validateJson(p1) then
		return ResultModule.error("ModerationDetail.fromJsonData expects a valid moderation JSON response")
	end
	local NewRestrictionDetail = RestrictionDetailModule.new()
	
	if p1.restriction then
		NewRestrictionDetail.restriction = {
			source = p1.restriction.source,
			moderationStatus = p1.restriction.moderationStatus,
			startTime = p1.restriction.startTime,
			endTime = p1.restriction.endTime,
			durationSeconds = p1.restriction.durationSeconds
		}
	end
	return ResultModule.success(NewRestrictionDetail)
end

return RestrictionDetailModule