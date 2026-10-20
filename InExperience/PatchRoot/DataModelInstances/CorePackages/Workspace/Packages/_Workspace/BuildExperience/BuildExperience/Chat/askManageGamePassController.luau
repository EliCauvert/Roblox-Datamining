local Parent = script:FindFirstAncestor("BuildExperience").Parent
local GamePassConfigModule = require(Parent.DataHydration.GamePassConfig)
local PromiseModule = require(Parent.Promise)
local _ = require(script.Parent.chatTypes)
local _ = require(script.Parent.localToolOverlay)
local CreateManageGamePassStoreModule = require(script.Parent.createManageGamePassStore)
local CreateMonetizationToolControllerModule = require(script.Parent.createMonetizationToolController)
local v1 = nil

local function _()
	-- upvalues: v1 (ref), CreateManageGamePassStoreModule (copy)
	if v1 == nil then
		v1 = CreateManageGamePassStoreModule()
	end
	return v1
end

local config = {
	itemKind = "gamePass",
	resultKey = "gamePass",
	tool = require(Parent.DataHydration.CreatorAgentChat).StudioManageGamePassTool,
	list = function(p1)
		-- upvalues: v1 (ref), CreateManageGamePassStoreModule (copy), GamePassConfigModule (copy), PromiseModule (copy)
		if v1 == nil then
			v1 = CreateManageGamePassStoreModule()
		end
		return v1.list(p1):andThen(function(Result)
			return {
				count = #Result.gamePasses,
				gamePasses = Result.gamePasses,
				nextPageToken = Result.nextPageToken,
				truncated = Result.isIncomplete == true
			}
		end, function(p2)
			-- upvalues: GamePassConfigModule (upval), PromiseModule (upval)
			return if typeof(p2) == "table" and p2.code == GamePassConfigModule.INCOMPLETE_LIST_CODE then {
				truncated = true,
				count = #p2.gamePasses,
				gamePasses = p2.gamePasses,
				nextPageToken = p2.nextPageToken,
				truncatedReason = p2.message
			} else PromiseModule.reject(p2)
		end)
	end,
	mutate = function(p1, p2)
		-- upvalues: v1 (ref), CreateManageGamePassStoreModule (copy), PromiseModule (copy)
		if p2.action == "create" then
			if v1 == nil then
				v1 = CreateManageGamePassStoreModule()
			end
			return v1.create(p1, {
				isForSale = false,
				name = p2.name,
				description = p2.description,
				priceInRobux = p2.priceInRobux
			})
		elseif p2.action == "update" then
			if v1 == nil then
				v1 = CreateManageGamePassStoreModule()
			end
			return v1.update(p1, p2.gamePassId, {
				name = p2.name,
				description = p2.description,
				priceInRobux = p2.priceInRobux
			})
		elseif p2.action == "activate" then
			if v1 == nil then
				v1 = CreateManageGamePassStoreModule()
			end
			return v1.activate(p1, p2.gamePassId)
		else
			if p2.action ~= "deactivate" then
				return PromiseModule.reject({
					errorMessage = ("Unsupported action '%s'."):format((tostring(p2.action)))
				})
			end
			if v1 == nil then
				v1 = CreateManageGamePassStoreModule()
			end
			return v1.deactivate(p1, p2.gamePassId)
		end
	end,
	itemIdOf = function(p1)
		return if p1.gamePassId == nil then nil else tostring(p1.gamePassId)
	end
}

return function(p1, p2, p3, p4)
	-- upvalues: CreateMonetizationToolControllerModule (copy), config (copy)
	return CreateMonetizationToolControllerModule(config, p1, p2, p3, p4)
end