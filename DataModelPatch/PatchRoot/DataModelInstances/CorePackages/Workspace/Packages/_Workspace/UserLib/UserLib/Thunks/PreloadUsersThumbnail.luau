local UserLib = script:FindFirstAncestor("UserLib")
local Parent = UserLib.Parent
local CryoModule = require(Parent.Cryo)
local PromiseUtilities = require(Parent.AppCommonLib).Utils.PromiseUtilities
local _ = require(UserLib.Utils)
local PromiseModule = require(Parent.Promise)
local ConstantsModule = require(UserLib.Utils.Constants)
local GetRbxthumbWithTypeSizeAndOptionsFunction = require(UserLib.Utils).getRbxthumbWithTypeSizeAndOptions

local function subdivideEntries(p1, p2: number)
	-- upvalues: CryoModule (copy)
	local List = {}
	
	for i = 1, #p1, p2 do
		table.insert(List, (CryoModule.List.getRange(p1, i, i + p2 - 1)))
	end
	return List
end

local function _(p3, p4, p5)
	-- upvalues: PromiseModule (copy), ConstantsModule (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (copy)
	return (PromiseModule.new(function(Callback: () -> (), _)
		-- upvalues: p3 (copy), p4 (copy), ConstantsModule (upval), GetRbxthumbWithTypeSizeAndOptionsFunction (upval), p5 (copy)
		local List = {}
		local t = {}
		
		for _, value in p3 do
			t[value] = {}
			
			for _, value1 in p4 do
				t[value][value1.thumbnailType] = t[value][value1.thumbnailType] or {}
				local v1 = GetRbxthumbWithTypeSizeAndOptionsFunction(value, ConstantsModule.RbxAvatarThumbnailTypeFromEnumToRbxthumbType[value1.thumbnailType], ConstantsModule.RbxThumbnailSizeToNumberSize[value1.thumbnailSize])
				t[value][value1.thumbnailType][value1.thumbnailSize] = v1
				table.insert(List, v1)
			end
		end;
		(p5 or game:GetService("ContentProvider")):PreloadAsync(List)
		Callback()
	end))
end

return function(p6, p7, p8)
	-- upvalues: subdivideEntries (copy), PromiseModule (copy), ConstantsModule (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (copy), PromiseUtilities (copy)
	return function(_)
		-- upvalues: subdivideEntries (upval), p6 (copy), p7 (copy), p8 (copy), PromiseModule (upval), ConstantsModule (upval), GetRbxthumbWithTypeSizeAndOptionsFunction (upval), PromiseUtilities (upval)
		local List = {}
		
		for _, value in pairs((subdivideEntries(p6, 100))) do
			table.insert(List, (PromiseModule.new(function(Callback: () -> (), _)
				-- upvalues: value (copy), p7 (copy), ConstantsModule (upval), GetRbxthumbWithTypeSizeAndOptionsFunction (upval), p8 (copy)
				local List = {}
				local t = {}
				
				for _, value in value do
					t[value] = {}
					
					for _, value1 in p7 do
						t[value][value1.thumbnailType] = t[value][value1.thumbnailType] or {}
						local v2 = GetRbxthumbWithTypeSizeAndOptionsFunction(value, ConstantsModule.RbxAvatarThumbnailTypeFromEnumToRbxthumbType[value1.thumbnailType], ConstantsModule.RbxThumbnailSizeToNumberSize[value1.thumbnailSize])
						t[value][value1.thumbnailType][value1.thumbnailSize] = v2
						table.insert(List, v2)
					end
				end;
				(p8 or game:GetService("ContentProvider")):PreloadAsync(List)
				Callback()
			end)))
		end
		return PromiseUtilities.Batch(List)
	end
end