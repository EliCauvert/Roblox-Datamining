local Parent = script:FindFirstAncestor("AppChat").Parent
local CryoModule = require(Parent.Cryo)
local DataHydrationModule = require(Parent.DataHydration)
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local DataStatus = DataHydrationModule.DataStatus
local GetAndFetchUserNamesFunction = DataHydrationModule.UserProfile.getAndFetchUserNames
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local config = { status = DataStatus.Ready, namesByUserId = {} }

local function _(p1)
	return if p1 == "" then nil else p1
end

return function(p1)
	-- upvalues: CryoModule (copy), ReactModule (copy), SignalsModule (copy), config (copy), GetAndFetchUserNamesFunction (copy), DataStatus (copy), UseSignalStateFunction (copy)
	local Joined = table.concat(CryoModule.List.filter(p1, function(p2): boolean
		return tonumber(p2) ~= nil
	end), ",")
	
	return UseSignalStateFunction((ReactModule.useMemo(function()
		-- upvalues: Joined (copy), SignalsModule (upval), config (upval), GetAndFetchUserNamesFunction (upval), DataStatus (upval)
		if Joined == "" then
			return SignalsModule.createComputed(function()
				-- upvalues: config (upval)
				return config
			end)
		end
		local t = {}
		
		for _, value in string.split(Joined, ",") do
			t[value] = GetAndFetchUserNamesFunction(value)
		end
		return SignalsModule.createComputed(function(p2)
			-- upvalues: DataStatus (upval), t (copy)
			local Ready = DataStatus.Ready
			local NamesByUserId = {}
			
			for i, value in t do
				local StatusResult = value.status(p2)
				
				if StatusResult == DataStatus.NotReady then
					Ready = DataStatus.NotReady
				elseif StatusResult == DataStatus.Failed and Ready == DataStatus.Ready then
					Ready = DataStatus.Failed
				end
				local NamesResult = value.names(p2)
				
				if NamesResult then
					local CombinedName = NamesResult.combinedName
					local CombinedName1 = if CombinedName == "" then nil else CombinedName
					local Username = NamesResult.username
					NamesByUserId[i] = {
						combinedName = CombinedName1,
						username = if Username == "" then nil else Username
					}
				end
			end
			return { status = Ready, namesByUserId = NamesByUserId }
		end)
	end, { Joined })))
end