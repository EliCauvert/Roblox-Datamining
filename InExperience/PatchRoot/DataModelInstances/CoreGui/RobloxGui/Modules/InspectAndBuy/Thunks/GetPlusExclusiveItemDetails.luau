local Parent = script.Parent.Parent
local ThunkModule = require(Parent.Thunk)
local NetworkModule = require(Parent.Services.Network)
local SendCounterModule = require(Parent.Thunks.SendCounter)
local ConstantsModule = require(Parent.Constants)
local AssetInfoModule = require(Parent.Models.AssetInfo)
local SetAssetsModule = require(Parent.Actions.SetAssets)
local _ = require(game:GetService("CorePackages").Workspace.Packages.AvatarExperienceInspectAndBuy)
local list = { NetworkModule }

return function(p1)
	-- upvalues: ThunkModule (copy), list (copy), NetworkModule (copy), AssetInfoModule (copy), SetAssetsModule (copy), SendCounterModule (copy), ConstantsModule (copy)
	return ThunkModule.new(script.Name, list, function(p2, p3)
		-- upvalues: NetworkModule (upval), p1 (copy), AssetInfoModule (upval), SetAssetsModule (upval), SendCounterModule (upval), ConstantsModule (upval)
		local v1 = p3[NetworkModule]
		local List = {}
		
		for _, value in p1 do
			table.insert(List, {
				itemType = Enum.AvatarItemType.Asset.Value,
				id = tonumber(value) or 0
			})
		end
		return v1.getBatchItemDetailsV2(List):andThen(function(Result)
			-- upvalues: AssetInfoModule (upval), p2 (copy), SetAssetsModule (upval), SendCounterModule (upval), ConstantsModule (upval)
			if Result and Result.data then
				local FromGetItemDetailsV2Results = {}
				
				for _, entry in Result.data do
					table.insert(FromGetItemDetailsV2Results, AssetInfoModule.fromGetItemDetailsV2(entry))
				end
				p2:dispatch(SetAssetsModule(FromGetItemDetailsV2Results))
			end
			p2:dispatch(SendCounterModule(ConstantsModule.Counters.BatchGetItemDetails .. ConstantsModule.CounterSuffix.RequestSucceeded))
		end, function()
			-- upvalues: p2 (copy), SendCounterModule (upval), ConstantsModule (upval)
			p2:dispatch(SendCounterModule(ConstantsModule.Counters.BatchGetItemDetails .. ConstantsModule.CounterSuffix.RequestRejected))
		end)
	end)
end