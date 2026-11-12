return {
	new = function(p1)
		local Views = {}
		local v1 = nil
		
		local function _(View, Reason, p2, Timestamp)
			View.maxGap = math.max(View.maxGap, p2 - View.lastPresent)
			
			return {
				view = View,
				timestamp = Timestamp,
				duration = p2 - View.start,
				reason = Reason
			}
		end
		
		return {
			sample = function(Cells)
				-- upvalues: p1 (copy), Views (copy), v1 (ref)
				local NowResult = p1.now()
				local WallNowResult = p1.wallNow()
				local t = {}
				local List = {}
				local List1 = {}
				
				for i, cell in Cells do
					local Item = p1.getItem(cell)
					
					if Item then
						local IdentityResult = p1.identity(Item)
						
						if not t[IdentityResult] then
							t[IdentityResult] = true
							local View = Views[IdentityResult]
							
							if View then
								View.maxGap = math.max(View.maxGap, NowResult - View.lastPresent)
								View.lastPresent = NowResult
								View.count += 1
								View.cell = cell
							else
								local config = {
									count = 1,
									maxGap = 0,
									item = Item,
									cell = cell,
									uuid = p1.newUuid(),
									start = NowResult,
									startTimestamp = WallNowResult,
									precedingGap = if v1 then NowResult - v1 else -1,
									lastPresent = NowResult
								}
								Views[IdentityResult] = config
								table.insert(List, config)
							end
						end
					end
				end
				for i, view in Views do
					if not t[i] then
						local Item = p1.getItem(view.cell)
						local IdentityChanged: string = if Item and p1.identity(Item) ~= i then "identityChanged" else "notVisible"
						view.maxGap = math.max(view.maxGap, NowResult - view.lastPresent)
						table.insert(List1, {
							view = view,
							timestamp = WallNowResult,
							duration = NowResult - view.start,
							reason = IdentityChanged
						})
						Views[i] = nil
					end
				end
				v1 = NowResult
				
				if #List1 > 0 then
					p1.sendEnds(List1)
				end
				if #List > 0 then
					p1.sendStarts(List)
				end
			end,
			close = function(Reason)
				-- upvalues: p1 (copy), Views (copy), v1 (ref)
				local List = {}
				local NowResult = p1.now()
				local WallNowResult = p1.wallNow()
				
				for _, view in Views do
					view.maxGap = math.max(view.maxGap, NowResult - view.lastPresent)
					table.insert(List, {
						view = view,
						timestamp = WallNowResult,
						duration = NowResult - view.start,
						reason = Reason
					})
				end
				table.clear(Views)
				v1 = nil
				
				if #List > 0 then
					p1.sendEnds(List)
				end
			end
		}
	end
}