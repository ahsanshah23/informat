using com.Informat.WebAPI.Helper;
using com.Informat.WebAPI.Models;
using com.Informat.WebAPI.Repository;
using System.IO;
using System;
using System.Threading.Tasks;
using com.Informat.WebAPI.Responses;

namespace com.Informat.WebAPI.Services
{
    public interface ISubscriptionService
    {
        Task<UserSubscriptionResponse> CreateUserSubscription(UserSubscription data);
        Task<CheckSubscriptionResponseDto> CheckUserSubsciption(string userId);
    }

    public class SubscriptionService : ISubscriptionService
    {
        private readonly ISubscriptionRepo _subscriptionRepo;
        public SubscriptionService(ISubscriptionRepo subscriptionRepo)
        {
            _subscriptionRepo = subscriptionRepo;
        }

        public async Task<UserSubscriptionResponse> CreateUserSubscription(UserSubscription data)
        {
            var result = await _subscriptionRepo.CreateUserSubscription(data);
            
            return result;
        }

        public async Task<CheckSubscriptionResponseDto> CheckUserSubsciption(string userId)
        {
            var initialResponseModel = new CheckSubscriptionResponseDto();
            var result = await _subscriptionRepo.CheckUserSubsciption(userId);
            initialResponseModel.UserSubscriptionId = result.UserSubscriptionId;
            if (result == null)
            {
                initialResponseModel.Message = "No Subscription exists against this user";
                return initialResponseModel;
            }
            else if (DateTime.Today >= result.ExpiresOn)
            {
                initialResponseModel.Message = "Subscription Expired";
                initialResponseModel.ExpiresOn = result.ExpiresOn;
                initialResponseModel.ConsumedCount = result.ConsumedCount;
                initialResponseModel.OriginalCount = result.OriginalCount;
                initialResponseModel.Name = result.Name;
                return initialResponseModel;
            }
            else if (result.ConsumedCount >= result.OriginalCount)
            {
                initialResponseModel.Message = "Subscription Fully Consumed";
                initialResponseModel.ExpiresOn = result.ExpiresOn;
                initialResponseModel.ConsumedCount = result.ConsumedCount;
                initialResponseModel.OriginalCount = result.OriginalCount;
                initialResponseModel.Name = result.Name;
                return initialResponseModel;
            }
            else
            {
                initialResponseModel.Message = "Subscription Exists";
                initialResponseModel.IsValid = true;
                initialResponseModel.ExpiresOn = result.ExpiresOn;
                initialResponseModel.ConsumedCount = result.ConsumedCount;
                initialResponseModel.OriginalCount = result.OriginalCount;
                initialResponseModel.Name = result.Name;
                return initialResponseModel;
            }
        }
    }
}
