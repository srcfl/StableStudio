# Use the official Node.js Alpine image as the base
FROM node:lts-alpine3.18

RUN apk add git
#RUN apk add --no-cache build-base python3

# Set the working directory in the container
WORKDIR /app

# copy everything except stuff in .dockerignore
COPY . .

# fix credentials
#RUN chmod -R 777 /app

# Install dependencies
ENV YARN_ENABLE_INLINE_BUILDS=true
RUN yarn

# Build the project
# RUN yarn build


# Start the server
CMD ["yarn", "start", "--host", "0.0.0.0"]