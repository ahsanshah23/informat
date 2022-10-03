﻿using com.Informat.WebAPI.Helper;
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
    }
}