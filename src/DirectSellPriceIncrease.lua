-- ============================================================= --
-- Direct Sell Price Increase
-- Curato Farms
-- ============================================================= --


function ProductionPoint:directlySellOutputs()
	for outputFillTypeId in pairs(self.outputFillTypeIdsDirectSell) do
		local amount = self.storage:getFillLevel(outputFillTypeId)

		if amount > 0 then
			local revenue = 1 * amount * g_currentMission.economyManager:getPricePerLiter(outputFillTypeId)

			self.mission:addMoney(revenue, self.ownerFarmId, MoneyType.SOLD_PRODUCTS, true)
			self.storage:setFillLevel(0, outputFillTypeId)
		end
	end
end